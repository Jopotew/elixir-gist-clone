defmodule GitGistClone.GistsTest do
  use GitGistClone.DataCase

  alias GitGistClone.Gists

  describe "gists" do
    alias GitGistClone.Gists.Gist

    import GitGistClone.AccountsFixtures, only: [user_scope_fixture: 0]
    import GitGistClone.GistsFixtures

    @invalid_attrs %{name: nil, description: nil, user_id: nil, markup_text: nil}

    test "list_gists/1 returns all scoped gists" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      gist = gist_fixture(scope)
      other_gist = gist_fixture(other_scope)
      assert Gists.list_gists(scope) == [gist]
      assert Gists.list_gists(other_scope) == [other_gist]
    end

    test "get_gist!/2 returns the gist with given id" do
      scope = user_scope_fixture()
      gist = gist_fixture(scope)
      other_scope = user_scope_fixture()
      assert Gists.get_gist!(scope, gist.id) == gist
      assert_raise Ecto.NoResultsError, fn -> Gists.get_gist!(other_scope, gist.id) end
    end

    test "create_gist/2 with valid data creates a gist" do
      valid_attrs = %{name: "some name", description: "some description", user_id: "some user_id", markup_text: "some markup_text"}
      scope = user_scope_fixture()

      assert {:ok, %Gist{} = gist} = Gists.create_gist(scope, valid_attrs)
      assert gist.name == "some name"
      assert gist.description == "some description"
      assert gist.user_id == "some user_id"
      assert gist.markup_text == "some markup_text"
      assert gist.user_id == scope.user.id
    end

    test "create_gist/2 with invalid data returns error changeset" do
      scope = user_scope_fixture()
      assert {:error, %Ecto.Changeset{}} = Gists.create_gist(scope, @invalid_attrs)
    end

    test "update_gist/3 with valid data updates the gist" do
      scope = user_scope_fixture()
      gist = gist_fixture(scope)
      update_attrs = %{name: "some updated name", description: "some updated description", user_id: "some updated user_id", markup_text: "some updated markup_text"}

      assert {:ok, %Gist{} = gist} = Gists.update_gist(scope, gist, update_attrs)
      assert gist.name == "some updated name"
      assert gist.description == "some updated description"
      assert gist.user_id == "some updated user_id"
      assert gist.markup_text == "some updated markup_text"
    end

    test "update_gist/3 with invalid scope raises" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      gist = gist_fixture(scope)

      assert_raise MatchError, fn ->
        Gists.update_gist(other_scope, gist, %{})
      end
    end

    test "update_gist/3 with invalid data returns error changeset" do
      scope = user_scope_fixture()
      gist = gist_fixture(scope)
      assert {:error, %Ecto.Changeset{}} = Gists.update_gist(scope, gist, @invalid_attrs)
      assert gist == Gists.get_gist!(scope, gist.id)
    end

    test "delete_gist/2 deletes the gist" do
      scope = user_scope_fixture()
      gist = gist_fixture(scope)
      assert {:ok, %Gist{}} = Gists.delete_gist(scope, gist)
      assert_raise Ecto.NoResultsError, fn -> Gists.get_gist!(scope, gist.id) end
    end

    test "delete_gist/2 with invalid scope raises" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      gist = gist_fixture(scope)
      assert_raise MatchError, fn -> Gists.delete_gist(other_scope, gist) end
    end

    test "change_gist/2 returns a gist changeset" do
      scope = user_scope_fixture()
      gist = gist_fixture(scope)
      assert %Ecto.Changeset{} = Gists.change_gist(scope, gist)
    end
  end

  describe "saved_gists" do
    alias GitGistClone.Gists.SavedGist

    import GitGistClone.GistsFixtures

    @invalid_attrs %{}

    test "list_saved_gists/0 returns all saved_gists" do
      saved_gist = saved_gist_fixture()
      assert Gists.list_saved_gists() == [saved_gist]
    end

    test "get_saved_gist!/1 returns the saved_gist with given id" do
      saved_gist = saved_gist_fixture()
      assert Gists.get_saved_gist!(saved_gist.id) == saved_gist
    end

    test "create_saved_gist/1 with valid data creates a saved_gist" do
      valid_attrs = %{}

      assert {:ok, %SavedGist{} = saved_gist} = Gists.create_saved_gist(valid_attrs)
    end

    test "create_saved_gist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gists.create_saved_gist(@invalid_attrs)
    end

    test "update_saved_gist/2 with valid data updates the saved_gist" do
      saved_gist = saved_gist_fixture()
      update_attrs = %{}

      assert {:ok, %SavedGist{} = saved_gist} = Gists.update_saved_gist(saved_gist, update_attrs)
    end

    test "update_saved_gist/2 with invalid data returns error changeset" do
      saved_gist = saved_gist_fixture()
      assert {:error, %Ecto.Changeset{}} = Gists.update_saved_gist(saved_gist, @invalid_attrs)
      assert saved_gist == Gists.get_saved_gist!(saved_gist.id)
    end

    test "delete_saved_gist/1 deletes the saved_gist" do
      saved_gist = saved_gist_fixture()
      assert {:ok, %SavedGist{}} = Gists.delete_saved_gist(saved_gist)
      assert_raise Ecto.NoResultsError, fn -> Gists.get_saved_gist!(saved_gist.id) end
    end

    test "change_saved_gist/1 returns a saved_gist changeset" do
      saved_gist = saved_gist_fixture()
      assert %Ecto.Changeset{} = Gists.change_saved_gist(saved_gist)
    end
  end
end

defmodule GitGistClone.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GitGistClone.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name",
        user_id: "some user_id"
      })

    {:ok, gist} = GitGistClone.Gists.create_gist(scope, attrs)
    gist
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> GitGistClone.Gists.create_saved_gist()

    saved_gist
  end
end

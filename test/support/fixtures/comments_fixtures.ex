defmodule GitGistClone.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GitGistClone.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        markup_text: "some markup_text"
      })

    {:ok, comment} = GitGistClone.Comments.create_comment(scope, attrs)
    comment
  end
end

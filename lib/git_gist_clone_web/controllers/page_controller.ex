defmodule GitGistCloneWeb.PageController do
  use GitGistCloneWeb, :controller

  def home(conn, _params) do
    render(conn, :home )
  end
end

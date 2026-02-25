defmodule GitGistCloneWeb.PageController do
  use GitGistCloneWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end

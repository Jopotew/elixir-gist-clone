defmodule GitGistCloneWeb.UserLive.CreateGistLive do
  use GitGistCloneWeb, :live_view
  import Phoenix.HTML.Form
  alias GitGistClone.{Gists, Gists.Gist}


  def mount(_params, _session, socket) do
    scope = socket.assigns.current_scope

    gist = %Gist{user_id: scope.user.id}

    socket =
      assign(socket,
        form: to_form(
          Gists.change_gist(scope, gist)
        )
      )

    {:ok, socket}
  end

end

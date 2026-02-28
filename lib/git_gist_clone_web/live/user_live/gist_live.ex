defmodule GitGistCloneWeb.UserLive.GistLive do
  use GitGistCloneWeb, :live_view
  alias GitGistClone.Gists

  def mount(params, _session, socket) do

    IO.inspect(params, label: "PARAMETROS RECIBIDOS")

    case params do
      %{"id" => id} ->
        scope = socket.assigns.current_scope
        gist = Gists.get_gist!(scope, id)
        {:ok, assign(socket, :gist, gist)}

      _ ->
        {:ok, socket |> put_flash(:error, "Gist no encontrado") |> redirect(to: "/")}
    end
  end
end

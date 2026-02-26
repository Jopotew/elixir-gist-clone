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


  def handle_event("validate", %{"gist" => gist_params}, socket) do
  scope = socket.assigns.current_scope

  changeset =
    scope
    |> Gists.change_gist(%Gist{user_id: scope.user.id}, gist_params)
    |> Map.put(:action, :validate)

  {:noreply, assign(socket, :form, to_form(changeset))}
end

  def handle_event("create", %{"gist" => gist_params}, socket) do
    scope = socket.assigns.current_scope

    case Gists.create_gist(scope, gist_params) do
      {:ok, _gist} ->
        changeset = Gists.change_gist(scope, %Gist{user_id: scope.user.id})
        {:noreply, assign(socket, :form, to_form(changeset))}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end
end

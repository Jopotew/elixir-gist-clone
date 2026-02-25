defmodule GitGistClone.Repo do
  use Ecto.Repo,
    otp_app: :git_gist_clone,
    adapter: Ecto.Adapters.Postgres
end

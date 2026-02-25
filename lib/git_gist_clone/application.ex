defmodule GitGistClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GitGistCloneWeb.Telemetry,
      GitGistClone.Repo,
      {DNSCluster, query: Application.get_env(:git_gist_clone, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GitGistClone.PubSub},
      # Start a worker by calling: GitGistClone.Worker.start_link(arg)
      # {GitGistClone.Worker, arg},
      # Start to serve requests, typically the last entry
      GitGistCloneWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GitGistClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GitGistCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

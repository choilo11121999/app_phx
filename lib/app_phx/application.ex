defmodule AppPhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AppPhx.Repo,
      # Start the Telemetry supervisor
      AppPhxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AppPhx.PubSub},
      # Start the Endpoint (http/https)
      AppPhxWeb.Endpoint
      # Start a worker by calling: AppPhx.Worker.start_link(arg)
      # {AppPhx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AppPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AppPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

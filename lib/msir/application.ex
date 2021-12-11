defmodule Msir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Msir.Repo,
      # Start the Telemetry supervisor
      MsirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Msir.PubSub},
      # Start the Endpoint (http/https)
      MsirWeb.Endpoint
      # Start a worker by calling: Msir.Worker.start_link(arg)
      # {Msir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Msir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MsirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule NlwTags.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      NlwTags.Repo,
      # Start the Telemetry supervisor
      NlwTagsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: NlwTags.PubSub},
      # Start the Endpoint (http/https)
      NlwTagsWeb.Endpoint
      # Start a worker by calling: NlwTags.Worker.start_link(arg)
      # {NlwTags.Worker, arg}
      NlwTags.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NlwTags.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NlwTagsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

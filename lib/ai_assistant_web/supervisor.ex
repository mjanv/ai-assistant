defmodule AiAssistantWeb.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    children = [
      AiAssistantWeb.Telemetry,
      {Phoenix.PubSub, name: AiAssistant.PubSub},
      AiAssistantWeb.Endpoint
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

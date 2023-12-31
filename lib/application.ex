defmodule AiAssistant.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AiAssistant.Supervisor,
      AiAssistantWeb.Supervisor
    ]

    Supervisor.start_link(children,
      strategy: :one_for_one,
      name: Assistant.Application.Supervisor
    )
  end
end

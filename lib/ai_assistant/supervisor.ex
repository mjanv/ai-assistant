defmodule AiAssistant.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    children = [AiAssistant.Repo]
    pipeline = Application.fetch_env!(:ai_assistant, :pipeline)

    Supervisor.init(children ++ pipeline, strategy: :one_for_one)
  end
end

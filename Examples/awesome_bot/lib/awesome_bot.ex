defmodule AwesomeBot do
  use Application

  import Supervisor.Spec

  require Logger

  def start(_type, _args) do
    token = ExGram.Config.get(:ex_gram, :token)

    children = [
      supervisor(ExGram, []),
      supervisor(AwesomeBot.Bot, [:polling, token])
    ]

    opts = [strategy: :one_for_one, name: AwesomeBot]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting AwesomeBot")
        ok

      error ->
        Logger.error("Error starting AwesomeBot")
        error
    end
  end
end

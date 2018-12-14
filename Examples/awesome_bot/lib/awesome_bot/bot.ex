defmodule AwesomeBot.Bot do
  @bot :awesome_bot

  use ExGram.Bot,
    name: @bot

  def bot(), do: @bot

  def handle({:command, "start", _msg}, context) do
    msg = "Well hello! This is an awesome bot!"
    answer(context, msg)
  end
end

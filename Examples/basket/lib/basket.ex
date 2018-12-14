defmodule Basket do
  use Agent

  def start() do
    Agent.start_link(&MapSet.new/0, name: __MODULE__)
  end

  def product_in?(product) do
    Agent.get(__MODULE__, &MapSet.member?(&1, product))
  end

  def get() do
    Agent.get(__MODULE__, & &1)
  end

  def add(product) do
    Agent.update(__MODULE__, &MapSet.put(&1, product))
  end

  def remove(product) do
    Agent.update(__MODULE__, &(MapSet.delete(&1, product) |> MapSet.to_list()))
  end
end

defmodule BasketTest do
  use ExUnit.Case
  doctest Basket

  test "greets the world" do
    assert Basket.hello() == :world
  end
end

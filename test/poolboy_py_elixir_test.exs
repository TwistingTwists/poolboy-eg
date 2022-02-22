defmodule PoolboyPyElixirTest do
  use ExUnit.Case
  doctest PoolboyPyElixir

  test "greets the world" do
    assert PoolboyPyElixir.hello() == :world
  end
end

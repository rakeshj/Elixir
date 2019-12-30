defmodule PlugNewTest do
  use ExUnit.Case
  doctest PlugNew

  test "greets the world" do
    assert PlugNew.hello() == :world
  end
end

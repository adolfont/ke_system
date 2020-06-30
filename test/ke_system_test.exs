defmodule KeSystemTest do
  use ExUnit.Case
  doctest KeSystem

  test "greets the world" do
    assert KeSystem.hello() == :world
  end
end

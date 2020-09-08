defmodule FormulasTest do
  use ExUnit.Case
  alias Logic.Formula

  test "create a new atomic formula" do
    assert Formula.new(:p) == :p
  end

  test "create a new negated atomic formula" do
    assert Formula.new(:not, :p) == {:not, :p}
  end
end

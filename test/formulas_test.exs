defmodule FormulasTest do
  use ExUnit.Case
  alias Logic.Formula

  test "create a new atomic formula" do
    assert Formula.new(:p) == :p
  end

  test "create a new negated atomic formula" do
    assert Formula.new(:p, :not) == {:not, :p}
  end

  test "create a new negated composite formula" do
    not_not_p =
      Formula.new(:p)
      |> Formula.new(:not)
      |> Formula.new(:not)

    IO.inspect(not_not_p)
    assert not_not_p == {:not, {:not, :p}}
  end
end

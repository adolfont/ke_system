defmodule ValuationTest do
  use ExUnit.Case
  alias Logic.Valuation

  test "create a valuation for :p with  :t" do
    v = Valuation.new([:p], :t)

    assert Valuation.value(v, :p) == :t
  end

  test "create a valuation for :p, :q, :r; all  with :f" do
    v = Valuation.new([:p, :q, :r], :f)

    assert Valuation.value(v, :p) == :f
    assert Valuation.value(v, :q) == :f
    assert Valuation.value(v, :r) == :f
  end

  test "create a valuation v such that v(p)=f and v(q)=t" do
    v = Valuation.new(p: :f, q: :t)

    assert Valuation.value(v, :p) == :f
    assert Valuation.value(v, :q) == :t
  end
end

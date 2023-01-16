defmodule Logic.ValuationTest do
  use ExUnit.Case
  alias Logic.Valuation
  alias Logic.Formula

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

  # COMPLEX FORMULAS

  # UNARY

  test "create a valuation v such that v(p)=f  and obtain v(!p)=t" do
    v = Valuation.new(p: :f)

    formula = Formula.new(:p, :not)

    assert Valuation.value(v, formula) == :t
  end

  test "create a valuation v such that v(p)=t  and obtain v(!p)=f" do
    v = Valuation.new(p: :t)

    formula = Formula.new(:p, :not)

    assert Valuation.value(v, formula) == :f
  end

  # BINARY

  test "create a valuation v such that v(p)=f and v(q)=t and obtain v(p&q)=f" do
    v = Valuation.new(p: :f, q: :t)

    p_and_q = Formula.new({:p, :q}, :and)

    assert Valuation.value(v, p_and_q) == :f
  end

  test "create a valuation v such that v(p)=t and v(q)=t and obtain v(p&q)=t" do
    v = Valuation.new(p: :t, q: :t)

    p_and_q = Formula.new({:p, :q}, :and)

    assert Valuation.value(v, p_and_q) == :t
  end

  test "create a valuation v such that v(p)=f and v(q)=f and obtain v(p|q)=f" do
    v = Valuation.new(p: :f, q: :f)

    formula = Formula.new({:p, :q}, :or)

    assert Valuation.value(v, formula) == :f
  end

  test "create a valuation v such that v(p)=t and v(q)=f and obtain v(p|q)=t" do
    v = Valuation.new(p: :t, q: :f)

    formula = Formula.new({:p, :q}, :or)

    assert Valuation.value(v, formula) == :t
  end

  test "create a valuation v such that v(p)=t and v(q)=f and obtain v(p->q)=f" do
    v = Valuation.new(p: :t, q: :f)

    formula = Formula.new({:p, :q}, :implies)

    assert Valuation.value(v, formula) == :f
  end

  test "create a valuation v such that v(p)=f and v(q)=t and obtain v(p->q)=t" do
    v = Valuation.new(p: :f, q: :t)

    formula = Formula.new({:p, :q}, :implies)

    assert Valuation.value(v, formula) == :t
  end

  # COMBINATION

  test "create a valuation v such that v(p)=f and v(q)=t and obtain v(!(p->q))=f" do
    v = Valuation.new(p: :f, q: :t)

    formula = Formula.new({:p, :q}, :implies) |> Formula.new(:not)

    assert Valuation.value(v, formula) == :f
  end

  test "create a valuation v such that v(p)=f and v(q)=f and obtain v(!p->!q))=t" do
    v = Valuation.new(p: :f, q: :f)

    formula =
      {Formula.new(:p, :not), Formula.new(:q, :not)}
      |> Formula.new(:implies)

    assert Valuation.value(v, formula) == :t
  end
end

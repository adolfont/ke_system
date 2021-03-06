defmodule Logic.FormulaTest do
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

    assert not_not_p == {:not, {:not, :p}}
  end

  test "create a new conjunction p&q" do
    p_and_q = Formula.new({:p, :q}, :and)

    assert p_and_q == {:p, :and, :q}
  end

  test "create a new conjunction q&!r" do
    not_r = Formula.new(:r, :not)
    q_and_not_r = Formula.new({:q, not_r}, :and)

    assert q_and_not_r == {:q, :and, {:not, :r}}
  end

  test "create a new disjunction p|q" do
    p_or_q = Formula.new({:p, :q}, :or)

    assert p_or_q == {:p, :or, :q}
  end

  test "create p->q" do
    p_implies_q = Formula.new({:p, :q}, :implies)

    assert p_implies_q == {:p, :implies, :q}
  end

  test "get the connective for !p" do
    assert Formula.new(:p, :not)
           |> Formula.get_connective() == :not
  end

  test "get the connective for p&q" do
    assert Formula.new({:p, :q}, :and)
           |> Formula.get_connective() == :and
  end

  test "get the connective for p|q" do
    assert Formula.new({:p, :q}, :or)
           |> Formula.get_connective() == :or
  end

  test "get the connective for p->q" do
    assert Formula.new({:p, :q}, :implies)
           |> Formula.get_connective() == :implies
  end

  test "verifies that a formula is not atomic" do
    assert Formula.new({:p, :q}, :implies)
           |> Formula.is_atomic?() == false
  end

  test "verifies if a formula is atomic" do
    assert Formula.new(:p)
           |> Formula.is_atomic?() == true
  end

  test "the proper immediate subformulas of p&q  are p and q" do
    assert Formula.new({:p, :q}, :and)
           |> Formula.get_proper_immediate_subformulas() == [Formula.new(:p), Formula.new(:q)]
  end

  test "the proper immediate subformulas of !(p&q) is  p&q" do
    assert Formula.new({:p, :q}, :and)
           |> Formula.new(:not)
           |> Formula.get_proper_immediate_subformulas() == [Formula.new({:p, :q}, :and)]
  end
end

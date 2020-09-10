defmodule SignedFormulaTest do
  use ExUnit.Case
  alias Logic.SignedFormula
  alias Logic.Formula

  test "create a new atomic signed formula 'T P'" do
    sf = SignedFormula.new(:T, :p)

    assert SignedFormula.get_sign(sf) == :T
    assert SignedFormula.get_formula(sf) == Formula.new(:p)
  end

  test "create a new signed formula 'F P&Q'" do
    formula = Formula.new({:p, :q}, :and)
    sf = SignedFormula.new(:F, formula)

    assert SignedFormula.get_sign(sf) == :F
    assert SignedFormula.get_formula(sf) == formula
  end
end

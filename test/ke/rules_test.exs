defmodule KE.RulesTest do
  use ExUnit.Case
  alias KE.Rules
  alias Logic.SignedFormula
  alias Logic.Formula

  test "apply T-NOT to T !p and obtain F p" do
    formula = Formula.new(:p, :not)
    sf = SignedFormula.new(:T, formula)

    assert Rules.t_not(sf) == [{:F, :p}]
  end

  test "apply T-NOT to T !(p&q) and obtain F p&q" do
    formula = Formula.new({:p, :q}, :and) |> Formula.new(:not)
    sf = SignedFormula.new(:T, formula)

    assert Rules.t_not(sf) == [{:F, Formula.get_proper_immediate_subformulas(formula) |> hd()}]
  end

  test "apply F-NOT to F !(p&q) and obtain T p&q" do
    formula = Formula.new({:p, :q}, :and) |> Formula.new(:not)
    sf = SignedFormula.new(:F, formula)

    assert Rules.f_not(sf) == [{:T, Formula.get_proper_immediate_subformulas(formula) |> hd()}]
  end
end

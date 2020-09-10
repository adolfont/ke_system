defmodule Logic.SignedFormula do
  @signs [:T, :F]

  def new(sign, formula) when sign in @signs do
    {sign, formula}
  end

  def get_sign({sign, _}), do: sign
  def get_formula({_, formula}), do: formula
end

defmodule Logic.Formula do
  @binary_connectives [:and, :or, :implies]

  defguard is_binary_connective(value) when value in @binary_connectives

  def new(atom) when is_atom(atom) do
    atom
  end

  def new(atom, :not) when is_atom(atom) do
    {:not, atom}
  end

  def new(formula, :not) when is_tuple(formula) do
    {:not, formula}
  end

  def new({left_subformula, right_subformula}, connective)
      when is_binary_connective(connective) do
    {left_subformula, connective, right_subformula}
  end
end

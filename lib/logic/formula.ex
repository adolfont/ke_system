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

  def get_connective({:not, _}) do
    :not
  end

  def get_connective({_, conn, _}) when conn in @binary_connectives do
    conn
  end

  def get_proper_immediate_subformulas(atom) when is_atom(atom), do: []
  def get_proper_immediate_subformulas({:not, subformula}), do: [subformula]

  def get_proper_immediate_subformulas({left_subformula, conn, right_subformula})
      when conn in @binary_connectives,
      do: [left_subformula, right_subformula]

  def is_atomic?(atom) when is_atom(atom), do: true
  def is_atomic?(_), do: false
end

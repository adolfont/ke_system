defmodule Logic.Formula do
  def new(atom) when is_atom(atom) do
    atom
  end

  def new(atom, :not) when is_atom(atom) do
    {:not, atom}
  end

  def new(formula, :not) when is_tuple(formula) do
    {:not, formula}
  end
end

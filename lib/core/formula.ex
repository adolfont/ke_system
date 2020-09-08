defmodule Logic.Formula do
  def new(atom) when is_atom(atom) do
    atom
  end

  def new(:not, atom) when is_atom(atom) do
    {:not, atom}
  end
end

defmodule Logic.Formula do
  def new(atom) when is_atom(atom) do
    atom
  end
end

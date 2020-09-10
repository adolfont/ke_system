defmodule Logic.Valuation do
  @values [:t, :f]

  def new(atoms_values_keyword_list) do
    Enum.into(atoms_values_keyword_list, %{})
  end

  def new(atoms, value) when value in @values do
    Map.new(atoms, fn x -> {x, value} end)
  end

  def value(valuation, atom) when is_atom(atom) do
    Map.get(valuation, atom)
  end
end

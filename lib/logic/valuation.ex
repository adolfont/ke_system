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

  def value(valuation, {:not, subformula}) do
    cond do
      value(valuation, subformula) == :t ->
        :f

      true ->
        :t
    end
  end

  def value(valuation, {left, :and, right}) do
    cond do
      value(valuation, left) == :t and value(valuation, right) == :t ->
        :t

      true ->
        :f
    end
  end

  def value(valuation, {left, :or, right}) do
    cond do
      value(valuation, left) == :f and value(valuation, right) == :f ->
        :f

      true ->
        :t
    end
  end

  def value(valuation, {left, :implies, right}) do
    cond do
      value(valuation, left) == :t and value(valuation, right) == :f ->
        :f

      true ->
        :t
    end
  end
end

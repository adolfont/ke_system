defmodule KE.Rules do
  def t_not({:T, {:not, formula}}) do
    [{:F, formula}]
  end

  def t_not(_), do: []

  def f_not({:F, {:not, formula}}) do
    [{:T, formula}]
  end

  def f_not(_), do: []
end

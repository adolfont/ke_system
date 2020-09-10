defmodule KE.Rules do
  def t_not({:T, {:not, formula}}) do
    [{:F, formula}]
  end
end

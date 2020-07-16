defmodule KE.Core do
  defstruct formulas: [],
            status: :open

  def new(formulas, status \\ :open) do
    %__MODULE__{
      formulas: formulas,
      status: status
    }
  end
end

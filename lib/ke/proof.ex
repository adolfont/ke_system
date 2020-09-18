defmodule KE.Proof do
  defstruct [:signed_formulas, :left_branch, :right_branch]

  def new(signed_formulas) when length(signed_formulas) > 0 do
    %__MODULE__{signed_formulas: signed_formulas}
  end

  def new(proof = %__MODULE__{}) do
    proof
  end

  def apply(proof = %__MODULE__{}, _rule) do
    # Here the rule must be the PB rule
    # the rule is applied and a new proof is returned
    # Does the PB rule can always be applied?
    proof
  end
  def apply(proof = %__MODULE__{}, _rule, _premise) do
    # One of of the one-premise rules can only be applied if
    # 1. the premise is part of the list of sfs
    # 2. (?) its conclusion(s) are not part of the branch
    proof
  end
  def apply(proof = %__MODULE__{}, _rule, _premise1, _premise2) do
    # One of of the two-premise rules can only be applied if
    # 1. the premises are part of the list of sfs
    # 2. (?) its conclusion is not part of the branch
    proof
  end
end

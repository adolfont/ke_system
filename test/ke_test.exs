defmodule KeTest do
  use ExUnit.Case
  alias KE.Core

  test "creates an empty and open KE" do
    assert Core.new([]) == %KE.Core{formulas: [], status: :open}
  end

  test "creates an empty and closed KE" do
    assert Core.new([], :closed) == %KE.Core{formulas: [], status: :closed}
  end
end

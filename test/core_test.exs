defmodule CoreTest do
  use ExUnit.Case
  alias KE.Core

  test "creates an empty and open KE" do
    assert Core.new([]) == %KE.Core{formulas: [], status: :open}
  end

  test "creates an empty and closed KE" do
    assert Core.new([], :closed) == %KE.Core{formulas: [], status: :closed}
  end

  test "closes an open KE" do
    Core.new([])
    |> assert_is_open()
    |> Core.close()
    |> assert_is_closed()
  end

  defp assert_is_open(ke = %{status: status}) do
    assert status == :open
    ke
  end

  defp assert_is_closed(ke = %{status: status}) do
    assert status == :closed
    ke
  end
end

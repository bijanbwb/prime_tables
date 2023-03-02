defmodule PrimesTablesTest do
  use ExUnit.Case
  doctest PrimesTables

  describe "run" do
    test "provides errors for invalid input values" do
      assert {:error, _error_message} = PrimesTables.run(0)
      assert {:error, _error_message} = PrimesTables.run(1.5)
    end
  end
end

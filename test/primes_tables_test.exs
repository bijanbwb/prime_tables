defmodule PrimesTablesTest do
  use ExUnit.Case
  doctest PrimesTables

  describe "run/1" do
    test "provides errors for invalid input values" do
      assert {:error, _error_message} = PrimesTables.run(0)
      assert {:error, _error_message} = PrimesTables.run(1.5)
    end
  end

  describe "find_primes/1" do
    test "finds no primes for an empty list of numbers" do
      assert [] == PrimesTables.find_primes([])
    end

    test "finds primes from 2 to 10" do
      # Given
      numbers = Enum.to_list(2..10)

      # When
      result = PrimesTables.find_primes(numbers)

      # Then
      assert result == [2, 3, 5, 7]
    end
  end
end

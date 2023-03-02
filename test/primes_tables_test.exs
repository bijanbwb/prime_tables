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
      # Given
      numbers = []

      # When
      result = PrimesTables.find_primes(numbers)

      # Then
      assert Enum.empty?(result)
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

  describe "generate_multiplication_table/1" do
    test "generates an empty string for no primes" do
      # Given
      prime_numbers = []

      # When
      result = PrimesTables.generate_multiplication_table(prime_numbers)

      # Then
      assert is_binary(result)
      assert result == ""
    end

    test "generates the correct number of rows in the multiplication table" do
      # Given
      prime_numbers = [2, 3, 5]

      # When
      result = PrimesTables.generate_multiplication_table(prime_numbers)

      lines_in_output =
        result
        |> String.trim_trailing()
        |> String.split("\n")
        |> Enum.count()

      # Then
      expected_lines_in_output = Enum.count(prime_numbers) + 1
      assert lines_in_output == expected_lines_in_output
    end

    test "generates a multiplication table string for the first 3 prime numbers" do
      # Given
      prime_numbers = [2, 3, 5]

      # When
      result = PrimesTables.generate_multiplication_table(prime_numbers)

      # Then
      expected_output = """
      |  x |  2 |  3 |  5 |
      |  2 |  4 |  6 | 10 |
      |  3 |  6 |  9 | 15 |
      |  5 | 10 | 15 | 25 |
      """

      assert result == expected_output
    end
  end
end

defmodule PrimesTablesTest do
  use ExUnit.Case
  doctest PrimesTables

  import ExUnit.CaptureIO

  describe "run/1" do
    test "provides errors for invalid input values" do
      assert {:error, _error_message} = PrimesTables.run(0)
      assert {:error, _error_message} = PrimesTables.run(1.5)
    end

    test "prints a multiplication table to stdout for 3 prime numbers" do
      # Given
      input = 3

      # When

      actual_output =
        capture_io(fn ->
          :ok = PrimesTables.run(input)
        end)
        |> String.trim()

      # Then
      expected_output =
        """
        |  x |  2 |  3 |  5 |
        |  2 |  4 |  6 | 10 |
        |  3 |  6 |  9 | 15 |
        |  5 | 10 | 15 | 25 |
        """
        |> String.trim()

      assert actual_output == expected_output
    end

    test "prints a multiplication table to stdout for 5 prime numbers" do
      # Given
      input = 5

      # When

      actual_output =
        capture_io(fn ->
          :ok = PrimesTables.run(input)
        end)
        |> String.trim()

      # Then
      expected_output =
        """
        |  x |  2 |  3 |  5 |  7 | 11 |
        |  2 |  4 |  6 | 10 | 14 | 22 |
        |  3 |  6 |  9 | 15 | 21 | 33 |
        |  5 | 10 | 15 | 25 | 35 | 55 |
        |  7 | 14 | 21 | 35 | 49 | 77 |
        | 11 | 22 | 33 | 55 | 77 | 121 |
        """
        |> String.trim()

      assert actual_output == expected_output
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

  describe "generate_fibonacci_sequence/1" do
    test "generates sequence of fibonacci numbers from 0 to 0" do
      # Given
      number_to_generate = 0

      # When
      result = PrimesTables.generate_n_fibonacci_numbers(number_to_generate)

      # Then
      assert result == []
    end

    test "generates sequence of fibonacci numbers from 0 to 1" do
      # Given
      number_to_generate = 1

      # When
      result = PrimesTables.generate_n_fibonacci_numbers(number_to_generate)

      # Then
      assert result == [0]
    end

    test "generates sequence of fibonacci numbers from 0 to 2" do
      # Given
      number_to_generate = 2

      # When
      result = PrimesTables.generate_n_fibonacci_numbers(number_to_generate)

      # Then
      assert result == [0, 1]
    end

    test "generates sequence of fibonacci numbers from 0 to 5" do
      # Given
      number_to_generate = 5

      # When
      result = PrimesTables.generate_n_fibonacci_numbers(number_to_generate)

      # Then
      assert result == [0, 1, 1, 2, 3]
    end

    test "generates sequence of fibonacci numbers from 0 to 22" do
      # Given
      number_to_generate = 10

      # When
      result = PrimesTables.generate_n_fibonacci_numbers(number_to_generate)

      # Then
      assert result == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    end
  end

  describe "take_n_prime_numbers/2" do
    test "returns the first 3 prime numbers" do
      # Given
      prime_numbers =
        2..100
        |> Enum.to_list()
        |> PrimesTables.find_primes()

      prime_numbers_to_find = 3

      # When
      result = PrimesTables.take_n_prime_numbers(prime_numbers, prime_numbers_to_find)

      # Then
      assert result == [2, 3, 5]
    end

    test "returns the first 10 prime numbers" do
      # Given
      prime_numbers =
        2..100
        |> Enum.to_list()
        |> PrimesTables.find_primes()

      prime_numbers_to_find = 10

      # When
      result = PrimesTables.take_n_prime_numbers(prime_numbers, prime_numbers_to_find)

      # Then
      assert result == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
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

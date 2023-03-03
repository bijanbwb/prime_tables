defmodule PrimesTables do
  @moduledoc """
  This application is intended to gather a list of N prime numbers where N is
  an input called `number_of_primes_to_find`.

  Then, we use those prime numbers to generate a string output with
  multiplication tables for those numbers.

  """

  #
  # Types
  #

  @type input() :: non_neg_integer()
  @type output() :: :ok | {:error, String.t()}

  #
  # Validation
  #

  defguardp is_valid_input(number) when is_integer(number) and number > 1

  #
  # Run
  #

  @spec run(number_of_primes_to_find :: input()) :: output()
  def run(number_of_primes_to_find) when is_valid_input(number_of_primes_to_find) do
    upper_bound = calculate_upper_bound(number_of_primes_to_find)

    Enum.to_list(2..upper_bound)
    |> find_primes()
    |> take_n_prime_numbers(number_of_primes_to_find)
    |> generate_multiplication_table()
    |> print_to_stdio()
  end

  def run(number_of_primes_to_find) do
    {:error,
     "The input value #{number_of_primes_to_find} should be a whole number greater than 1."}
  end

  @spec calculate_upper_bound(number :: non_neg_integer()) :: non_neg_integer()
  defp calculate_upper_bound(number) do
    # https://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number
    # n log(n) + n log(log(n))
    number * floor(:math.log(number)) +
      number * floor(:math.log(number) + :math.log(:math.log(number)))
  end

  @spec find_primes(list(non_neg_integer())) :: list(non_neg_integer())
  def find_primes([]), do: []

  def find_primes([number | tail]) do
    [number | find_primes(tail -- Enum.map(1..length(tail), fn n -> number * n end))]
  end

  @spec take_n_prime_numbers(list(non_neg_integer()), non_neg_integer()) ::
          list(non_neg_integer())
  def take_n_prime_numbers([], _number_of_primes_to_find), do: []

  def take_n_prime_numbers(prime_numbers, number_of_primes_to_find) do
    Enum.take(prime_numbers, number_of_primes_to_find)
  end

  @doc ~s"""
  Produces a multiplication table for a set of prime numbers.

  ## Example

      iex> PrimesTables.generate_multiplication_table([2, 3, 5])
      \"\"\"
      |  x |  2 |  3 |  5 |
      |  2 |  4 |  6 | 10 |
      |  3 |  6 |  9 | 15 |
      |  5 | 10 | 15 | 25 |
      \"\"\"
  """

  @spec generate_multiplication_table(prime_numbers :: list(non_neg_integer())) :: String.t()
  def generate_multiplication_table([]), do: ""

  def generate_multiplication_table(prime_numbers) do
    prime_numbers_with_offset = [1 | prime_numbers]

    prime_numbers_with_offset
    |> Enum.reduce("", fn x, acc ->
      row_starting_string = acc <> "| #{format_number_for_table(x)} |"

      completed_row_string =
        Enum.reduce(prime_numbers_with_offset, row_starting_string, fn y, a ->
          if y > 1, do: a <> " #{format_number_for_table(x * y)} |", else: a
        end)

      completed_row_string <> "\n"
    end)
  end

  @spec format_number_for_table(number :: non_neg_integer()) :: String.t()
  defp format_number_for_table(number) when number == 1, do: String.pad_leading("x", 2)

  defp format_number_for_table(number) when number in 1..9 do
    number
    |> to_string()
    |> String.pad_leading(2)
  end

  defp format_number_for_table(number), do: to_string(number)

  def print_to_stdio(output) do
    IO.puts(:stdio, output)
  end
end

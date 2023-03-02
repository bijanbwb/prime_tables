defmodule PrimesTables do
  @moduledoc """
  This application is intended to gather a list of prime numbers from `2` to
  an input value `number`.

  Then, we use those prime numbers to generate a string output with
  multiplication tables for those numbers.

  """

  #
  # Types
  #

  @type input() :: non_neg_integer()
  @type output() :: String.t() | {:error, String.t()}

  #
  # Run
  #

  @spec run(number :: input()) :: output()
  def run(number) when is_integer(number) and number > 1 do
    numbers = Enum.to_list(2..number)

    prime_numbers = find_primes(numbers)

    generate_multiplication_table(prime_numbers)
  end

  def run(number) do
    {:error, "The input value #{number} should be a whole number greater than 1."}
  end

  @spec find_primes(list(non_neg_integer())) :: list(non_neg_integer())
  def find_primes([]), do: []

  def find_primes(numbers) do
    # TODO: Replace temporary naive prime check.
    primes = Enum.filter(numbers, &is_prime/1)

    [2, 3 | primes]
  end

  @spec is_prime(number :: non_neg_integer()) :: boolean()
  defp is_prime(number) when number > 3 do
    rem(number, 2) != 0 and rem(number, 3) != 0
  end

  defp is_prime(_number), do: false

  @doc """
  Produces a multiplication table for a set of prime numbers.

  ## Example

    - First three primes are [2, 3, 5]

  ## Expected Output

  |  x |  2 |  3 |  5 |
  |  2 |  4 |  6 | 10 |
  |  3 |  6 |  9 | 15 |
  |  5 | 10 | 15 | 25 |

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
end

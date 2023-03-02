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

    # [{1, 1}, {2, 2}, {3, 3}, {5, 5}]
    zip_list = Enum.zip(prime_numbers_with_offset, prime_numbers_with_offset)

    zip_list
    |> Enum.reduce("", fn {x, _y}, acc ->
      row_string = acc <> "#{x}"

      s =
        Enum.reduce(zip_list, row_string, fn {_x2, y2}, a ->
          if y2 > 1 do
            a <> "#{x * y2}"
          else
            a
          end
        end)

      s <> "\n"
    end)
  end
end

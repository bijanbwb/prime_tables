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

    _prime_numbers = find_primes(numbers)

    "output"
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
  def is_prime(number) when number > 3 do
    rem(number, 2) != 0 and rem(number, 3) != 0
  end

  def is_prime(_number), do: false
end

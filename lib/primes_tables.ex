defmodule PrimesTables do
  @moduledoc """
  Documentation for `PrimesTables`.
  """

  @spec run(input :: non_neg_integer()) :: String.t() | {:error, String.t()}
  def run(input) when is_integer(input) and input > 1 do
    "output"
  end

  def run(input) do
    {:error, "The input value #{input} should be a whole number greater than 1."}
  end
end

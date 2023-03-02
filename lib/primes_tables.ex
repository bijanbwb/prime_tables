defmodule PrimesTables do
  @moduledoc """
  Documentation for `PrimesTables`.
  """

  #
  # Types
  #

  @type input() :: non_neg_integer()
  @type output() :: String.t() | {:error, String.t()}

  #
  # Run
  #

  @spec run(input :: input()) :: output()
  def run(input) when is_integer(input) and input > 1 do
    "output"
  end

  def run(input) do
    {:error, "The input value #{input} should be a whole number greater than 1."}
  end
end

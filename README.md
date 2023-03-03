# ✖️ PrimesTables

This is a coding challenge to gather the first n prime numbers and generate
a multiplication table for those numbers as output.

## 🛠️ Setup

- Install [Elixir](https://elixir-lang.org/install.html).
- Fetch dependencies with `mix deps.get`.
- Compile with `mix compile`.

## 🏃‍♀️ Running the Project

You can run the project with the following to see a multiplication table
printed to std output:

```sh
$ mix run -e "PrimesTables.run(3)"
|  x |  2 |  3 |  5 |
|  2 |  4 |  6 | 10 |
|  3 |  6 |  9 | 15 |
|  5 | 10 | 15 | 25 |
```

## ⚗️ Running the Tests

- Run all the tests for the project with `mix test`.
- There's also a test watcher available with `mix test.watch`.
- Typespecs can be verified with `mix dialyzer`.

## 📝 Notes

- Structure of the Solution
    - validate input
    - calculate an upper bound
    - find primes
    - take n primes
    - generate table
    - print output
- Potential Future Work
    - Use a different data structure for the table (instead of list -> string) with a [Map](https://hexdocs.pm/elixir/1.12/Map.html) or the [Nx library](https://hexdocs.pm/nx/Nx.html), and then use it to produce the string output
    - Build a nice web UI with Phoenix to visualize the algorithm instead of printing to stdout
    - Benchmark finding primes with [`benchee`](https://github.com/bencheeorg/benchee)

## 📖 Reference

- [Sieve Algorithm](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
- [Approximating the nth Prime Number](https://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number)

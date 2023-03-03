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

- Overall happy with the way the problem was divided up and tested:
    - validate input
    - find primes
    - generate table
    - print output
- Potential future work:
    - The table generation could probably be split:
        - use a different data structure for the table (instead of a list) with map or try the [Nx library](https://hexdocs.pm/nx/Nx.html)
        - produce the string output from the data structure
  - Build a nice UI with Phoenix instead of printing to stdout
  - Benchmark finding primes with [`benchee`](https://github.com/bencheeorg/benchee)

## 📖 Reference

- [Sieve Algorithm](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
- [Approximating the nth Prime Number](https://en.wikipedia.org/wiki/Prime_number_theorem#Approximations_for_the_nth_prime_number)

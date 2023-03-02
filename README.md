# ✖️ PrimesTables

This is a coding challenge to gather a list of prime numbers and generate
a multiplication table for those numbers as output.

## 🛠️ Setup

- Install [Elixir](https://elixir-lang.org/install.html).
- Fetch dependencies with `mix deps.get`.
- Compile with `mix compile`.

## 🏃‍♀️ Running the Project

You can run the project with the following to see a multiplication table
printed to std output:

```sh
$ mix run -e "PrimesTables.run(5)"
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
- Realized at the end that the challenge was to find N primes and not all the
  primes from 2 to N. I can try to push a quick fix for this given a little
  more time.
- I had to look up the sieve algorithm [on Wikipedia](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes).
    - Given a little more time I'd probably use [`benchee`](https://github.com/bencheeorg/benchee) to try a more performant approach.
- It would be fun to build a UI instead of printing to stdout.

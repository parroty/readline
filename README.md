readline (experimental)
=====
A readline wrapper for Elixir. It's experimental and may not work well.

Readline
========

```elixir
> iex -S mix

> Readline.Nif.add_history(3, 'abc')
> Readline.Nif.add_history(3, 'def')
> msg = Readline.Nif.readline(6, 'user> ')
> IO.puts msg

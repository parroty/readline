defmodule Readline do
  def run1 do
    msg = 'hello world'
    len = :erlang.iolist_size(msg)
    Readline.Nif.printf(len, msg)
  end

  def run2 do
    msg = Readline.Nif.scanf
    IO.puts msg
    msg
  end

  def run3 do
    Readline.Nif.add_history(3, 'abc')
    Readline.Nif.add_history(3, 'def')
    msg = Readline.Nif.readline(6, 'user> ')
    IO.puts msg
  end
end

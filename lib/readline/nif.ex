defmodule Readline.Nif do
  @on_load { :init, 0 }
  @moduledoc """
  NIF module
  """

  @doc false
  def init do
    path = :filename.join(:code.priv_dir(:readline), 'readline')
    :ok  = :erlang.load_nif(path, 1)
  end

  @doc false
  def scanf do
    exit(:nif_library_not_loaded)
  end

  @doc false
  def printf(_, _) do
    exit(:nif_library_not_loaded)
  end

  @doc false
  def readline(_, _) do
    exit(:nif_library_not_loaded)
  end

  @doc false
  def add_history(_, _) do
    exit(:nif_library_not_loaded)
  end
end

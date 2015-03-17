defmodule Mix.Tasks.Compile.Readline do
  use Mix.Task
  @shortdoc "Compiles readline library"
  def run(_) do
    if Mix.shell.cmd("make") != 0 do
      raise Mix.Error, message: """
        Could not run `make`.
        Please check if `clang`/`gcc` and `cmake` are installed.
      """
    end
  end
end

defmodule Readline.Mixfile do
  use Mix.Project

  def project do
    [app: :readline,
     version: "0.0.1",
     elixir: "~> 1.0",
     compilers: [:readline, :elixir, :app],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end
end

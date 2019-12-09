defmodule Helloplug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :helloplug,
      version: "0.1.0",
      elixir: "~> 1.5",
      escript: [main_module: Example],
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
	mod: {Helloplug, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
def deps do
  [{:cowboy, "~> 1.0.0"},
   {:plug, "~> 1.0"},
   {:bamboo_smtp, "~> 1.4.0"}]
end

end

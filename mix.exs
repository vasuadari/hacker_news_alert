defmodule HackerNewsAlert.MixProject do
  use Mix.Project

  def project do
    [
      app: :hacker_news_alert,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mojito, "~> 0.6.3"},
      {:floki, "~> 0.26.0"},
      {:mail, "~> 0.2"},
      {:swoosh, "~> 0.25.0"},
      {:gen_smtp, "~> 0.13"}
    ]
  end
end

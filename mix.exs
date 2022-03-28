defmodule Adyen.MixProject do
  use Mix.Project

  @version "0.1.0-alpha-1"
  @url "https://github.com/christopherlai/adyen"
  @name "Adyen"

  def project do
    [
      app: :adyen,
      deps: deps(),
      docs: docs(),
      elixir: "~> 1.13",
      homepage: @url,
      name: @name,
      package: package(),
      source: @url,
      start_permanent: Mix.env() == :prod,
      version: @version
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
      {:ex_doc, "~> 0.28", only: :dev, runtime: false},
      {:hackney, "~> 1.18", optional: true},
      {:jason, "~> 1.3", optional: true}
    ]
  end

  defp docs do
    [
      main: @name,
      source_ref: "v#{@version}",
      source_url: @url,
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      description: "Adyen Checkout API Wrapper",
      files: ["lib", "mix.exs", "README.md"],
      mantainers: ["Christopher Lai"],
      licenses: ["MIT"],
      links: %{github: @url}
    ]
  end
end

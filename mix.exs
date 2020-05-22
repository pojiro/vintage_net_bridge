defmodule VintageNetBridge.MixProject do
  use Mix.Project

  @version "0.7.0"
  @source_url "https://github.com/nerves-networking/vintage_net_bridge"

  def project do
    [
      app: :vintage_net_bridge,
      version: @version,
      elixir: "~> 1.7",
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      build_embedded: true,
      deps: deps(),
      dialyzer: dialyzer(),
      docs: docs(),
      package: package(),
      description: description()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "Bridge networking for VintageNet"
  end

  defp package do
    %{
      files: [
        "lib",
        "test",
        "mix.exs",
        "README.md",
        "LICENSE",
        "CHANGELOG.md"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    }
  end

  defp deps do
    [
      {:vintage_net, "~> 0.8.0-dev", github: "nerves-networking/vintage_net", branch: "master"},
      {:credo, "~> 1.2", only: :test, runtime: false},
      {:dialyxir, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.19", only: :docs, runtime: false},
      {:excoveralls, "~> 0.8", only: :test, runtime: false}
    ]
  end

  defp dialyzer() do
    [
      flags: [:race_conditions, :unmatched_returns, :error_handling, :underspecs]
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end
end

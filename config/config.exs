# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mercafacil,
  ecto_repos: [Mercafacil.Repo]

# Configures the endpoint
config :mercafacil, MercafacilWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zrox2+B6Gd6UWS4c75DSf5yf3P3dT6CDxqnk1dkJJLFVho4wJjPMvjzCgWmJNEt0",
  render_errors: [view: MercafacilWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mercafacil.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

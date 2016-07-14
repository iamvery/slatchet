# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :slatchet,
  ecto_repos: [Slatchet.Repo]

# Configures the endpoint
config :slatchet, Slatchet.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TiAFB/OJTnbEntYdAPQzzzoOiAn5g+0sg9GRBqLlGlJMETFU1a3p7WiT4QHW6ncO",
  render_errors: [view: Slatchet.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Slatchet.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

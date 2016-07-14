use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :slatchet, Slatchet.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :slatchet, Slatchet.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "slatchet_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

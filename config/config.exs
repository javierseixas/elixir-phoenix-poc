# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :my_app,
  ecto_repos: [MyApp.Repo],
  generators: [binary_id: true]

# Add support for microseconds at the DB level
# this avoids having to configure it on every migration file
config :my_app, MyApp.Repo, migration_timestamps: [type: :utc_datetime_usec]

# Configures the endpoint
config :my_app, MyAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4CB/flp3L2arQ028tll/iuu0Cnja9p5o5F6hYVHuyGho78Ky8w6AmztvvNIKEIig",
  render_errors: [view: MyAppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MyApp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "SQiKODxZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :goth,
  json: "elixir-phoenix-poc-d7a70b5f9c2a.json" |> File.read!

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

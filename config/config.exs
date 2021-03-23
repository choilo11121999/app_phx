# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :app_phx,
  ecto_repos: [AppPhx.Repo]

# Configures the endpoint
config :app_phx, AppPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vtLRC+Yg98OhL61uT8nHpE2v2dn0+WbfKf35NdukA+IjZj0YJujfRXtIFSNhODZw",
  render_errors: [view: AppPhxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AppPhx.PubSub,
  live_view: [signing_salt: "/2ejjT9P"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

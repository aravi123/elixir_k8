# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_k8, ElixirK8Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8yHrAqzd/5EiL1bUN+pnbWEERlt61YVm1hRaNDyTa9COUQVVB+QcPmThiZ46NCaD",
  render_errors: [view: ElixirK8Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirK8.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

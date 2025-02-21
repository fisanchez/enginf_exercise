# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weather,
  ecto_repos: [Weather.Repo],
  env: :dev

# Configures the endpoint
config :weather, WeatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "47zk1PtVrs01ltSZu9akbgqqHRzj3YG0+oDjqpEjhf3e+nRIwb9NYJCCO5EX5/lg",
  render_errors: [view: WeatherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Weather.PubSub, adapter: Phoenix.PubSub.PG2],
  weather_api_key: System.get_env("WEATHER_BIT_API_KEY")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

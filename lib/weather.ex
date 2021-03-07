defmodule Weather do
  @moduledoc """
  Weather keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # Formats into readable query for WeatherBit
  #
  def format_query(latitude, longitude) do
    api_key = Application.get_env(:weather, WeatherWeb.Endpoint)[:weather_api_key]
    "https://api.weatherbit.io/v2.0/current?lat=#{latitude}&lon=#{longitude}&key=#{api_key}"
  end

  # Accects string in format: ?longitude=###&latitude=###
  # @param query [String]
  # @return JSON if valid query
  def get(query) do
    %{body: body} = HTTPoison.get! query
    Poison.decode!(body)["data"]
  end
end

defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  def index(conn, params) do
    if params["latitude"] == nil || params["longitude"] == nil do
      conn
      |> send_resp(400, "Missing latitude or longitude param")
    end

    latitude = params['latitude']
    longitude = params['longitude']

    weather = Weather.format_query(latitude, longitude) |> Weather.get()
    render(conn, "index.json", %{data: weather})
  end
end

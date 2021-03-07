defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  def index(conn, %{"latitude" => latitude, "longitude" => longitude}) do
    weather = Weather.format_query(latitude, longitude) |> Weather.get()
    render(conn, "index.json", %{data: weather})
  end
end

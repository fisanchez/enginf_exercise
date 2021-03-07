defmodule WeatherWeb.WeatherView do
  use WeatherWeb, :view

  def render("index.json", %{data: foo}) do
    %{
      "data" => foo
    }
  end
end

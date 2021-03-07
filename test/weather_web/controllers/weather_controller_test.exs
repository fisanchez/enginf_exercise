defmodule WeatherWeb.WeatherControllerTest do
  use WeatherWeb.ConnCase

  test "GET / happy path", %{conn: conn} do
    conn = get(conn, "/weather?latitude=33.7984&longitude=-84.3883")
    json_response(conn, 200)
  end
end

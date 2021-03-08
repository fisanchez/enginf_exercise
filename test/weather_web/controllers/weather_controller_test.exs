defmodule WeatherWeb.WeatherControllerTest do
  use WeatherWeb.ConnCase

  test "GET / happy path", %{conn: conn} do
    conn = get(conn, "/weather?latitude=33.7984&longitude=-84.3883")
    json_response(conn, 200)
  end

  test "GET / missing params", %{conn: conn} do
    conn = get(conn, "/weather")
    assert text_response(conn,400) == "Missing latitude or longitude param"
  end

  test "GET / missing latitude params", %{conn: conn} do
    conn = get(conn, "/weather?longitude=-84.3883")
    assert text_response(conn,400) == "Missing latitude or longitude param"
  end

  test "GET / missing longitude params", %{conn: conn} do
    conn = get(conn, "/weather?latitude=33.7984")
    assert text_response(conn,400) == "Missing latitude or longitude param"
  end
end

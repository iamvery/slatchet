defmodule Slatchet.PageControllerTest do
  use Slatchet.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Slatchet"
  end
end

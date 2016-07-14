defmodule YourData do
  use Data, for: :you
  def data(conn), do: %{name: Plug.Conn.get_session(conn, :you)}
end

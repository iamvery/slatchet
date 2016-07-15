defmodule Slatchet.ChannelController do
  use Slatchet.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end
end

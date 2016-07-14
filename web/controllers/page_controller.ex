defmodule Slatchet.PageController do
  use Slatchet.Web, :controller

  plug YourData
  plug ChannelsData
  plug ChannelData
  plug MessagesData

  def index(conn, _params) do
    render conn, "index.html"
  end
end

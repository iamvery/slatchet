defmodule Slatchet.ChannelController do
  use Slatchet.Web, :controller

  plug YourData
  plug ChannelData
  plug ChannelsData
  plug MessagesData

  def show(conn, _params) do
    render conn, "show.html"
  end
end

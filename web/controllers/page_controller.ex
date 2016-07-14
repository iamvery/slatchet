defmodule Slatchet.PageController do
  use Slatchet.Web, :controller

  plug :channel_data

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp channel_data(conn, _opts) do
    merge_data conn, %{
      channel: %{name: "ohai"},
    }
  end

  # TODO move this to ratchet lib in some form
  defp merge_data(conn, data) do
    data = Map.merge(conn.assigns.data, data)
    %{conn | assigns: %{conn.assigns | data: data}}
  end
end

defmodule Slatchet.PageController do
  use Slatchet.Web, :controller

  plug :channels_data
  plug :channel_data
  plug :messages_data
  plug :your_data

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp channels_data(conn, _opts) do
    merge_data conn, %{
      channels: [
        %{name: "lolwat", message_count: "42"},
        %{name: "ohai", message_count: "3"},
        %{name: "noice", message_count: "10,437"},
      ],
    }
  end

  defp channel_data(conn, _opts) do
    merge_data conn, %{
      channel: %{name: "ohai"},
    }
  end

  defp messages_data(conn, _opts) do
    merge_data conn, %{
      messages: Message.all,
    }
  end

  defp your_data(conn, _opts) do
    merge_data conn, %{
      you: %{name: "Jay"},
    }
  end

  # TODO move this to ratchet lib in some form
  defp merge_data(conn, data) do
    data = Map.merge(conn.assigns.data, data)
    %{conn | assigns: %{conn.assigns | data: data}}
  end
end

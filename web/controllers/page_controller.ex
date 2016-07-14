defmodule Slatchet.PageController do
  use Slatchet.Web, :controller

  plug :channels_data
  plug :channel_data
  plug :messages_data

  def index(conn, _params) do
    render conn, "index.html"
  end

  defp channels_data(conn, _opts) do
    merge_data conn, %{
      channels: [
        %{name: "lolwat"},
        %{name: "ohai"},
        %{name: "noice"},
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
      messages: [
        %{person: "Jay", body: "Hi! How is everyone?"},
        %{person: "Les", body: "Very well! Also, I love you ;)"},
        %{person: "Jay", body: "Why is your picture me? xD"},
      ],
    }
  end

  # TODO move this to ratchet lib in some form
  defp merge_data(conn, data) do
    data = Map.merge(conn.assigns.data, data)
    %{conn | assigns: %{conn.assigns | data: data}}
  end
end

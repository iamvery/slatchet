defmodule ChannelsData do
  use Ratchet.Plug.Data, for: :channels

  @channels ["lolwat", "ohai", "noice"]

  def data(conn) do
    Enum.map(@channels, &channel_data(conn, &1))
  end

  defp channel_data(conn, name) do
    %{name: name, message_count: Message.count |> inspect}
  end
end

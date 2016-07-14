defmodule ChannelsData do
  use Data, for: :channels

  def data(_conn) do
    [
      %{name: "lolwat", message_count: "42"},
      %{name: "ohai", message_count: inspect(Message.count)},
      %{name: "noice", message_count: "10,437"},
    ]
  end
end

defmodule ChannelData do
  use Ratchet.Plug.Data, for: :channel
  def data(_conn), do: %{name: "ohai"}
end

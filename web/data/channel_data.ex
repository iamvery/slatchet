defmodule ChannelData do
  use Data, for: :channel
  def data(_conn), do: %{name: "ohai"}
end

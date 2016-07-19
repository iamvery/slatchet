defmodule ChannelData do
  use Ratchet.Plug.Data, for: :channel
  def data(%{params: params}), do: %{name: params["id"]}
end

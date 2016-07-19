defmodule MessagesData do
  use Ratchet.Plug.Data, for: :messages
  def data(%{assigns: assigns}), do: Message.for(assigns.data.channel.name)
end

defmodule MessagesData do
  use Ratchet.Plug.Data, for: :messages
  def data(_conn), do: Message.all
end

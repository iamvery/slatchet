defmodule MessagesData do
  use Data, for: :messages
  def data(_conn), do: Message.all
end

# TODO this is probably ratchet library code
# maybe name this Ratchet.Data.Plug?
defmodule Data do
  defmacro __using__([for: name]) do
    quote do
      @behaviour Plug
      def init([]), do: false
      def call(conn, _opts), do: Data.merge(conn, %{unquote(name) => data(conn)})
    end
  end

  # TODO move this to ratchet lib in some form
  def merge(conn, data) do
    data = Map.merge(conn.assigns.data, data)
    %{conn | assigns: %{conn.assigns | data: data}}
  end
end

defmodule Message do
  def start_link do
    Agent.start_link(fn -> {0, []} end, name: __MODULE__)
  end

  def all do
    Agent.get(__MODULE__, fn {_count, messages} -> messages end)
  end

  def count, do: length(all)

  def add(person, body) do
    message = %{person: person, body: body}
    Agent.update(__MODULE__, fn {count, messages} -> {count+1, [message|messages]} end)
  end
end

defmodule Message do
  def start_link do
    Agent.start_link(fn -> {0, []} end, name: __MODULE__)
  end

  def all do
    Agent.get(__MODULE__, fn {_count, messages} -> messages end)
  end

  def count, do: length(all)

  def add(channel, person, body) do
    time = Timex.now |> Timex.format!("%l:%M %p", :strftime)
    message = %{channel: channel, person: person, body: body, time: time}
    Agent.update(__MODULE__, fn {count, messages} -> {count+1, [message|messages]} end)
  end
end

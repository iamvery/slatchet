defmodule Message do
  use Ratchet.Mutable, endpoint: Slatchet.Endpoint

  def start_link do
    Agent.start_link(fn -> {0, []} end, name: __MODULE__)
  end

  def all do
    Agent.get(__MODULE__, fn {_count, messages} -> messages end)
  end

  def count, do: length(all)

  def add(person, body) do
    time = Timex.now |> Timex.format!("%l:%M %p", :strftime)
    message = %{person: person, body: body, time: time}
    Agent.update(__MODULE__, fn {count, messages} -> {count+1, [message|messages]} end)
  end

  action :create, mutates: [messages: all] do
    add(params[:person], params[:body])
  end
end

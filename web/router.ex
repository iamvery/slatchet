# TODO this should be moved to the phoenix_ratchet project
defmodule Ratchet.Data.Plug do
  def init(_opts), do: false
  def call(conn, _opts) do
    assigns = Map.put(conn.assigns, :data, %{})
    %{conn | assigns: assigns}
  end
end

defmodule Slatchet.Router do
  use Slatchet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Ratchet.Data.Plug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Slatchet do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Slatchet do
  #   pipe_through :api
  # end
end

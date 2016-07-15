defmodule Slatchet.Router do
  use Slatchet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :have_a_name
    plug Ratchet.Plug.Data
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Slatchet do
    pipe_through :browser # Use the default browser stack

    resources "/channels", ChannelController, only: [:show]
    resources "/messages", MessageController, only: [:create]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Slatchet do
  #   pipe_through :api
  # end

  def have_a_name(conn, _opts) do
    if get_session(conn, :you) do
      conn
    else
      put_session(conn, :you, Faker.Name.first_name)
    end
  end
end

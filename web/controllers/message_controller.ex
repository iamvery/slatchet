defmodule Slatchet.MessageController do
  use Slatchet.Web, :controller

  def create(conn, %{"message" => message_params}) do
    Message.add("ohai", get_session(conn, :you), message_params["body"])
    redirect conn, to: "/"
  end
end

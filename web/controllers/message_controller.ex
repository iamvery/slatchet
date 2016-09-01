defmodule Slatchet.MessageController do
  use Slatchet.Web, :controller

  def create(conn, %{"message" => message_params}) do
    Message.create(person: get_session(conn, :you), body: message_params["body"])
    redirect conn, to: "/"
  end
end

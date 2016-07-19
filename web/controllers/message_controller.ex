defmodule Slatchet.MessageController do
  use Slatchet.Web, :controller

  def create(conn, %{"channel_id" => channel, "message" => message_params}) do
    Message.add(channel, get_session(conn, :you), message_params["body"])
    redirect conn, to: "/"
  end
end

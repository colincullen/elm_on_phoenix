defmodule ElmOnPhoenixWeb.PageController do
  use ElmOnPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

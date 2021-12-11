defmodule MsirWeb.PageController do
  use MsirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

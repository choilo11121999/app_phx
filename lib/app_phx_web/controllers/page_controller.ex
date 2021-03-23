defmodule AppPhxWeb.PageController do
  use AppPhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule ElixirK8Web.PageController do
  use ElixirK8Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

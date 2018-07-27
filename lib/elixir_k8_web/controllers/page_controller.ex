defmodule ElixirK8Web.PageController do
  use ElixirK8Web, :controller
  require DogStatsd

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn,_params) do
    {:ok,statsd} = DogStatsd.new("10.63.245.131", 8125)
    IO.puts("here")
    DogStatsd.increment(statsd, "fucking.asshole")
    IO.puts("Here")
    text conn, "fucker"
  end
end

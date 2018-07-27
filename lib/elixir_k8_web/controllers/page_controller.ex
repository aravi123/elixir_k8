defmodule ElixirK8Web.PageController do
  use ElixirK8Web, :controller
  require DogStatsd

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn,_params) do
    IO.puts(Application.get_env(:elixir_k8,ElixirK8Web.Endpoint)[:dogstatsd])
    {:ok,statsd} = DogStatsd.new(Application.get_env(:elixir_k8,ElixirK8Web.Endpoint)[:dogstatsd], 8125)
    IO.puts("here")
    DogStatsd.increment(statsd, "fucking.asshole")
    IO.puts("Here")
    text conn, "fucker"
  end
end

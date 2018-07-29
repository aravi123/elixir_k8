defmodule ElixirK8Web.PageController do
  use ElixirK8Web, :controller
  require DogStatsd

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn,_params) do
    IO.puts(System.get_env("DD_KUBERNETES_KUBELET_HOST"))
    {:ok,statsd} = DogStatsd.new(System.get_env("DD_KUBERNETES_KUBELET_HOST"), 8125)
    IO.puts("here")
    DogStatsd.increment(statsd, "fucking.asshole")
    IO.puts("Here")
    text conn, "hello"
  end
end

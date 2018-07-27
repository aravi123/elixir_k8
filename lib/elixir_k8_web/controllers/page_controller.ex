defmodule ElixirK8Web.PageController do
  use ElixirK8Web, :controller
  require DogStatsd

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn,_params) do
    IO.puts(System.get_env("DD_KUBERNETES_KUBELET_HOST"))
    IO.puts(System.get_env())
    {:ok,statsd} = DogStatsd.new(System.get_env("DD_KUBERNETES_KUBELET_HOST"), 8080)
    IO.puts("here")
    DogStatsd.increment(statsd, "fucking.asshole")
    IO.puts("Here")
    text conn, "fucker"
  end
end

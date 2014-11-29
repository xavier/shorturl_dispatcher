defmodule ShorturlDispatcherTest do
  use ExUnit.Case, async: true
  use Plug.Test

  use PlugTestHelpers

  alias ShorturlDispatcher.Redirector, as: Redirector

  @opts Redirector.init([])

  test "returns 200" do
    conn = conn(:get, "/")
    conn = Redirector.call(conn, @opts)

    assert_status :ok
  end

  test "redirect to the matching URL for foo" do
    conn = conn(:get, "/foo")
    conn = Redirector.call(conn, @opts)

    assert_redirect "http://example.com"
  end

  test "redirect to the matching URL for bar" do
    conn = conn(:get, "/bar")
    conn = Redirector.call(conn, @opts)

    assert_redirect "http://spam.com"
  end

  test "returns 404 for unknown URL" do
    conn = conn(:get, "/bogus")
    conn = Redirector.call(conn, @opts)

    assert_status :not_found
  end

end

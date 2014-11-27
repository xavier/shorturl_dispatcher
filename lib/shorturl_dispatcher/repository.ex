defmodule ShorturlDispatcher.Repository do

  @urls %{
    "foo" => "http://example.com",
    "bar" => "http://spam.com"
  }

  def fetch_by_code(code) do
    Dict.fetch(@urls, code)
  end
end
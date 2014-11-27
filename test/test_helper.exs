ExUnit.start()

defmodule PlugTestHelpers do

  defmacro assert_redirect(conn, url) do
    quote do
      conn = unquote(conn)
      assert conn.status == 302
      assert Enum.into(conn.resp_headers, HashDict.new)["location"] == unquote(url)
    end
  end

end
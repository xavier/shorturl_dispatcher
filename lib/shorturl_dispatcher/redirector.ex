defmodule ShorturlDispatcher.Redirector do
  use Plug.Router
  import Plug.Conn

  alias ShorturlDispatcher.Repository, as: Repository
  
  plug :match
  plug :dispatch

  get "/" do 
    send_resp(conn, 200, "")
  end

  get "/:short_code" do 
    case Repository.fetch_by_code(short_code) do
      {:ok, url} ->
        conn 
        |> Plug.Conn.put_resp_header("location", url)
        |> send_resp(302, "") 
      :error -> 
        send_resp(conn, 404, "")
    end

  end

end
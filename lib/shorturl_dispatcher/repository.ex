defmodule ShorturlDispatcher.Repository do
  import Ecto.Query

  def fetch_by_code(code) do
    query = from su in ShorturlDispatcher.Shorturl,
      where: su.code == ^code,
      limit: 1,
      select: su.url
    case ShorturlDispatcher.Datastore.all(query) do
      [url] -> {:ok, url}
      []    -> :error
    end
  end
end
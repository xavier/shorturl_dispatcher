defmodule ShorturlDispatcher.Datastore do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://bdusauso@localhost/shorturl_dispatcher"
  end

  def priv do
    app_dir(:shorturl_dispatcher, "priv/rep")
  end
end 
defmodule ShorturlDispatcher.Datastore.Migrations.CreateShorturls do
  use Ecto.Migration

  def up do
    [
      "CREATE TABLE IF NOT EXISTS shorturls(id serial primary key, code text, url text)",
      "CREATE UNIQUE INDEX index_on_code ON shorturls (code)"
    ]
  end

  def down do
    ["DROP TABLE shorturls"]
  end
end

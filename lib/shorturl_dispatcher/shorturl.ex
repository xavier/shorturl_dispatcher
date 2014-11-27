defmodule ShorturlDispatcher.Shorturl do
  use Ecto.Model

  schema "shorturls" do
    field :code, :string
    field :url,  :string
  end
end
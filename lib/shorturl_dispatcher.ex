defmodule ShorturlDispatcher do
  use Application

  def start(_type, _args) do
    ShorturlDispatcher.Supervisor.start_link
  end
end
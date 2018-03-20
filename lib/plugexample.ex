defmodule Plugexample do
  use Application
  require Logger

  @moduledoc """
  Documentation for Plugexample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Plugexample.hello
      :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    port = Application.get_env(:plugexample, :cowboy_port, 4000)
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Plugexample.Router, [], port: port)
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

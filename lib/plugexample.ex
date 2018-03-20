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
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Plugexample.Router, [], port: 4000)
    ]
    Logger.info("Started application")
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

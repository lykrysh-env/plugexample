defmodule PlugexampleTest do
  use ExUnit.Case
  doctest Plugexample

  test "greets the world" do
    assert Plugexample.hello() == :world
  end
end

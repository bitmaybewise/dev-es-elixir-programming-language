defmodule SampleProjectTest do
  use ExUnit.Case, async: true
  doctest SampleProject

  test "greets the world" do
    assert SampleProject.hello() == :world
  end
end

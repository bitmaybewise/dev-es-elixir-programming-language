defmodule TypedSampleTest do
  use ExUnit.Case, async: true
  doctest TypedSample

  test "adds two numbers" do
    assert TypedSample.add(1, 2) == 3
  end
end

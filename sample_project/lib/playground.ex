defmodule Playground do
  def play_with_typed_sample do
    # this works
    TypedSample.add(1, 1)
    TypedSample.age(1989)

    
    # fails with ArithmeticError at runtime
    # TypedSample.add("1", 1)
    # To perform static analysis: mix dialyzer
  end
end

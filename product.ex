defmodule Product do
  @enforce_keys [:name]
  defstruct [:name, :price, rating: 0]
end

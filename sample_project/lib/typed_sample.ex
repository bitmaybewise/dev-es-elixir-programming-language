defmodule TypedSample do
  @moduledoc """
  TypedSample module is used to show some Elixir features
  """

  @doc """
  Add two numbers.

  ## Examples

      iex> TypedSample.add(1, 1)
      2

      iex> TypedSample.add(0.1, -66.7)
      -66.6

  """
  @spec add(number, number) :: number
  def add(x, y), do: x + y

  @typedoc """
  A 4 digit year, e.g. 1984
  """
  @type year :: integer

  @doc """
  Calculates age given a birth year.

  ## Examples

      iex> TypedSample.age(1990)
      #{Date.utc_today.year - 1990}
      
  """
  @spec age(year) :: integer
  def age(birth) do
    Date.utc_today.year - birth
  end
end

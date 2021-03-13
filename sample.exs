# function calls with optional parenteses
IO.inspect(1)
IO.inspect 2

# binding
a_tuple = {:age, 31}
IO.inspect(a_tuple)

# string vs charlist
i_am_a_string = "i am a string"
IO.inspect i_am_a_string

i_am_a_charlist = 'i am a string'
IO.inspect i_am_a_charlist

# keyword list
ks_a = [{:a, 1}, {:b, 2}]
IO.inspect ks_a

# keyword list with syntax sugar
ks_b = [c: 3, d: 4]
IO.inspect ks_b

# hashmaps
my_hash = %{:a => 1, :hello => "world"}
IO.inspect(my_hash)
my_new_hash = Map.put(my_hash, :foo, :bar)
IO.inspect(my_new_hash)

# anonymous functions
hi = fn (name) -> IO.puts "hi, " <> name end
hi.("stranger!")

# syntax sugar to declare anonymous functions
hi = &(IO.puts "Hi, " <> &1)
hi.("again!")

# function capturing
up = &String.upcase/1
IO.inspect up.("olá!")

# matching
x = 1 # binding
1 = x # matching
x = 2 # rebinding

y = 2
^x = y

val = try do
  666 = x
rescue
  e in MatchError -> e
end
IO.inspect(val)

# pattern matching
{value_a, value_b, value_c} = {1, "one", :one}
IO.inspect(value_a)
IO.inspect(value_b)
IO.inspect(value_c)

[head | tail] = [1, 2, 3, 4]
IO.inspect(head)
IO.inspect(tail)

[a, b | _] = [1, 2, 3, 4]
IO.inspect(a)
IO.inspect(b)

# case, cond, if/else
val = case {1, 2, 3} do
  {666, _, _} -> 
    :never
  {1, b, c} when b > 5 -> 
    b + c
  {a, b, c} -> 
    a + b + c
end
IO.inspect(val)

val = cond do
  1 + 1 == 3 -> :never
  2 * 2 == 4 -> :aha
end
IO.inspect(val)

if true, do: IO.inspect(:one_liner_if)

if true do
  IO.inspect(:usual_if)
end

if false do
  :never
else
  IO.inspect(:if_false)
end

val = if true, do: :if_value
IO.inspect(val)

# loops
val = Enum.map([1, 2, 3], fn x -> x * 2 end)
IO.inspect(val)

val = Enum.map([1, 2, 3], &(&1 * 2))
IO.inspect(val)

fizz_buzz = &(rem(&1, 3) == 0 || rem(&1, 5) == 0)
val = Enum.map(1..100, &(&1 * 2)) |> Enum.filter(fizz_buzz) |> Enum.sum()
IO.inspect(val)

val = 1..1_000_000 
  |> Stream.filter(fizz_buzz) 
  |> Enum.take(3) 
  |> Enum.sum
IO.inspect(val)

# protocol
defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

IO.inspect Size.size("foo bar baz")
IO.inspect Size.size({:ok, :ok, :ok})
IO.inspect Size.size(%{hello: "world"})
val = try do
  Size.size([1, 2, 3])
rescue
  e in Protocol.UndefinedError -> e
end
IO.inspect(val)

# struct (via product.ex module)
default = %Product{name: "Wine", price: 10}
IO.inspect(default)

tv = %Product{name: "TV", price: 2000}
IO.inspect(tv)

smart_tv = %{tv | name: "Smart TV"}
IO.inspect(smart_tv)

IO.inspect(is_map(default))

good_wine = Map.merge(default, %Product{name: "Wine", rating: 5})
IO.inspect(good_wine)

# process
pid = spawn fn -> :hello end
IO.inspect(pid)
IO.inspect(Process.alive?(pid))

pid = spawn_link fn -> :hello end
IO.inspect(pid)

pid = spawn fn ->
  receive do
    {:hello, msg} -> IO.puts(msg)
  end
end
send pid, {:hi, "..."}
send pid, {:hello, "world"}

# agent
{:ok, pid} = Agent.start_link(fn -> %{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
val = Agent.get(pid, fn map -> Map.get(map, :hello) end)
IO.inspect(val)

{:ok, pid} = MyState.start_link
MyState.put(pid, :hello, "world")
MyState.put(pid, "foo", :bar)
IO.inspect(MyState.get(pid, :hello))
IO.inspect(MyState.get(pid, "foo"))

# task
{:ok, pid} = Task.start fn -> "hello" end
IO.inspect(pid)

task = Task.async fn -> Process.sleep(2000) end
Task.await(task)

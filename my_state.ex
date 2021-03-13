defmodule MyState do
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def get(pid, key) do
    Agent.get(pid, fn map -> Map.get(map, key) end)
  end

  def put(pid, key, value) do
    Agent.update(pid, fn map -> Map.put(map, key, value) end)
  end
end

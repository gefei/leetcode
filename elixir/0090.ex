defmodule Solution do
  @spec subsets_with_dup(nums :: [integer]) :: [[integer]]
  def subsets_with_dup(nums) do
    step(nums |> Enum.sort(), MapSet.new() |> MapSet.put([])) |> MapSet.to_list()
  end

  def step([], acc), do: acc
  def step([h|t], acc) do
    new_acc = MapSet.new(Enum.map(acc, &([h|&1]))) |> MapSet.union(acc)
    step(t, new_acc)
  end
end

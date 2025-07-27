defmodule Solution do
  @spec min_operations(nums :: [integer]) :: integer
  def min_operations(nums) do
    freq = Enum.frequencies(nums) |> Enum.map(fn {a,b} -> b end)
    step(freq, 0)
  end

  def step([], acc), do: acc
  def step([h|_t], _acc) when h == 1, do: -1
  def step([h|t], acc) do
    cond do
      rem(h, 3) == 0 -> step(t, acc+div(h, 3))
      rem(h, 3) == 1 -> step(t, acc+div(h-4, 3)+2)
      rem(h, 3) == 2 -> step(t, acc+div(h-2, 3)+1)
    end
  end
end

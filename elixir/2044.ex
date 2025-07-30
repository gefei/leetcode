defmodule Solution do
  use Bitwise
  def count_max_or_subsets(nums) do
    mx = Enum.reduce(nums, fn a, acc -> a ||| acc end)
    nums
      |> subsets([])
      |> step(mx, 0)
  end

  def step([], _mx, acc), do: acc
  def step([h|t], mx, acc) do
    res = Enum.reduce(h, fn a, acc -> a ||| acc end)
    if res == mx do
      step(t, mx, acc+1)
    else
      step(t, mx, acc)
    end
  end

  def subsets([], acc), do: acc
  def subsets([h|t], acc) do
    n = [[h] | Enum.map(acc, fn a -> [h|a] end)]
    subsets(t, n++acc)
  end
end

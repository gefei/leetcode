defmodule Solution do
  def subsets(nums) do
    subsets(nums, [[]])
  end

  def subsets([], acc), do: acc
  def subsets([h|t], acc) do
    n = Enum.map(acc, fn a -> [h|a] end)
    subsets(t, n++acc)
  end
end

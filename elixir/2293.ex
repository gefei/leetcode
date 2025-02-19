defmodule Solution do
  def min_max_game([h|t]=nums) do
    rec(nums)
  end

  def rec([h]),  do: h
  def rec(nums) do
    rec(mn(nums, []))
  end

  def mn([], acc), do: acc
  def mn([h|[h1|t]], acc) do
    mx(t, acc ++ [min(h, h1)])
  end

  def mx([], acc), do: acc
  def mx([h|[h1|t]], acc) do
    mn(t, acc ++ [max(h, h1)])
  end
end

IO.inspect(Solution.min_max_game([1,3,5,2,4,8,2,2]))
IO.inspect(Solution.min_max_game([3]))

defmodule Solution do
  @spec ways_to_split_array(nums :: [integer]) :: integer
  def ways_to_split_array(nums) do
    sum = Enum.sum(nums)
    rec(nums, 0, sum, 0)
  end

  def rec([_], _left_sum, _right_sum, acc), do: acc
  def rec([h|t], left_sum, right_sum, acc) do
    l = left_sum + h
    r = right_sum - h
    if (l >= r) do
      rec(t, l, r, acc+1)
    else
      rec(t, l, r, acc)
    end
  end
end

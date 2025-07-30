defmodule Solution do
  def longest_subarray(nums) do
    mx = Enum.max(nums)
    step(nums, mx, 0, 0)
  end

  def step([], _mx, _cur_len, acc), do: acc
  def step([h|t], mx, cur_len, acc) when h != mx do
    step(t, mx, 0, acc)
  end
  def step([h|t], mx, cur_len, acc) do
    new_acc = if cur_len + 1 > acc do cur_len + 1 else acc end
    step(t, mx, cur_len+1, new_acc)
  end
end

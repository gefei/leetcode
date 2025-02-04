defmodule Solution0485 do
  @spec find_max_consecutive_ones(nums :: [integer]) :: integer
  def find_max_consecutive_ones(nums) do
    rec(nums, 0, 0)
  end

  def rec([], cur_len, mx) do
    max(cur_len, mx)
  end

  def rec([h|t], cur_len, mx) do
     cond do
       h == 1 -> rec(t, (cur_len + 1), max(cur_len+1, mx))
       true -> rec(t, 0, mx)
     end
  end
end

IO.inspect(Solution0485.find_max_consecutive_ones([1,1,0,1,1,1]))
IO.inspect(Solution0485.find_max_consecutive_ones([1,0,1,1,0,1]))

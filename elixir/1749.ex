defmodule Solution do
  @spec max_absolute_sum(nums :: [integer]) :: integer
  def max_absolute_sum(nums) do
    a = hd(nums)
    max_abs(tl(nums), a, a, abs(a))
  end

  def max_abs([], _mx, _mn, acc), do: acc
  def max_abs([h|t], mx, mn, acc) do
    this_mx = cond do
       mx > 0 -> mx + h
       true -> h
    end
    this_mn = cond do
       mn < 0 -> mn + h
       true -> h
    end
    max_abs(t, this_mx, this_mn, Enum.max([acc, abs(this_mx), abs(this_mn)]))
  end
end

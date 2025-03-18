defmodule Solution do
  import Bitwise

  @spec longest_nice_subarray(nums :: [integer]) :: integer
  def longest_nice_subarray(nums) do
    rec(nums, 0, [], 0)
  end

  def rec([], all_or, hist, acc) do
    len = length(hist)
    if (len > acc) do len else acc end
  end

  def rec([h|t], all_or, hist, acc) do
    a = band(all_or, h)
    len = length(hist)
    if (a == 0) do
      rec(t, bor(all_or, h), [h|hist], acc)
    else
      next = hist |> Enum.take_while(&(band(&1, h) == 0)) |> Enum.reverse()
      rec(next ++ [h|t], 0, [], Enum.max([acc, len]))
    end
  end
end

defmodule Solution do
  @spec maximum_sum(nums :: [integer]) :: integer
  def maximum_sum(nums) do
    map = rec_map(nums, Map.new())
    pair_list = map |> Enum.filter(fn {_,b} -> length(b) == 2 end)
    if (pair_list == []) do
      -1
    else
      {a, b} = pair_list |> Enum.max(fn ({_, b1}, {_, b2}) -> Enum.sum(b1)>Enum.sum(b2) end, fn -> -1 end)
      Enum.sum(b)
    end
  end

  def rec_map([], acc), do: acc
  def rec_map([h|t], acc) do
    s = sum_digits(h)
    ls = Map.get(acc, s, [])
    rec_map(t, Map.put(acc, s, ls ++ [h] |> Enum.sort(&(&1 >= &2)) |> Enum.take(2)))
  end

  def sum_digits(num) do
    rec(num, 0)
  end

  def rec(0, acc), do: acc
  def rec(n, acc) do
    rec(div(n, 10), acc + rem(n, 10))
  end
end

IO.inspect(Solution.maximum_sum([18,43,36,13,7]), charlists: false)
IO.inspect(Solution.maximum_sum([10,12,19,14]))

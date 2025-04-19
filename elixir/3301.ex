defmodule Solution do
  @spec maximum_total_sum(maximum_height :: [integer]) :: integer
  def maximum_total_sum(maximum_height) do
    sorted = maximum_height |> Enum.sort(fn a,b -> a > b end)
    rec(sorted, (hd sorted), [])
  end

  def rec([], _, acc), do: Enum.sum(acc)
  def rec([h|t], cur, acc) when cur <= 0 do
    -1
  end
  def rec([h|t], cur, acc) when h >= cur do
    rec(t, cur-1, [cur|acc])
  end
  def rec([h|t], cur, acc) when h < cur do
    rec(t, h-1, [h|acc])
  end
end

Solution.maximum_total_sum([2,3,4,3]) |> IO.inspect()
Solution.maximum_total_sum([15,10]) |> IO.inspect()
Solution.maximum_total_sum([2,2,1]) |> IO.inspect()

defmodule Solution do
  @spec count_distinct_integers(nums :: [integer]) :: integer
  def count_distinct_integers(nums) do
    s1 = MapSet.new(nums)
    x = nums
        |> Enum.map(&(reverse(&1, 0)))
        |> MapSet.new()
    MapSet.union(s1, x) |> MapSet.size()
  end

  def reverse(0, acc), do: acc
  def reverse(n, acc) do
    reverse(div(n, 10), 10*acc+rem(n, 10))
  end
end

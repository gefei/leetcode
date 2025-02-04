defmodule Solution0219 do
  @spec contains_nearby_duplicate(nums :: [integer], k :: integer) :: boolean
  def contains_nearby_duplicate(nums, k) do
    x =
      nums
      |> Enum.with_index()
      |> Enum.group_by(fn {x, _} -> x end, fn {_, y} -> y end)
      |> Enum.map(fn {a, b} -> b end)
      |> Enum.filter(fn x -> Enum.count(x) >= 2 end)
      |> Enum.map(fn x -> min_diff(x) end)
    IO.inspect x
    if (Enum.count(x) < 1) do
      false
    else
      [a|b] = x
      a <= k
    end
  end

  def min_diff([h|t] = x) do
    {a,b} =
      Enum.zip(x, t)
      |> Enum.min_by(fn {a, b} -> b - a end)
    b-a
  end

end


x = Solution0219.contains_nearby_duplicate([1], 2)
IO.inspect(x)
x = Solution0219.contains_nearby_duplicate([1,2], 2)
IO.inspect(x)
x = Solution0219.contains_nearby_duplicate([1,2,3,1], 3)
IO.inspect(x)
x = Solution0219.contains_nearby_duplicate([1,0,1,1], 1)
IO.inspect(x)
x = Solution0219.contains_nearby_duplicate([1,2,3,1,2,3], 2)
IO.inspect(x)

defmodule Solution do
  @spec max_adjacent_distance(nums :: [integer]) :: integer
  def max_adjacent_distance([h|t]) do
    n1 = t ++ [h]
    Enum.zip([h|t], n1)
    |> Enum.map(fn {a,b} -> abs(a-b) end)
    |> Enum.max
  end
end

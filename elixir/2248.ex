defmodule Solution do
  @spec intersection(nums :: [[integer]]) :: [integer]
  def intersection(nums) do
    nums
    |> Enum.map(fn x -> MapSet.new(x) end)
    |> Enum.reduce(&(MapSet.intersection(&1, &2)))
    |> Enum.to_list()
    |> Enum.sort()
  end
end

IO.inspect(Solution.intersection([[3,1,2,4,5],[1,2,3,4],[3,4,5,6]]))

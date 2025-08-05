defmodule Solution do
  @spec num_of_unplaced_fruits(fruits :: [integer], baskets :: [integer]) :: integer
  def num_of_unplaced_fruits(fruits, baskets) do
    step(fruits, baskets, 0)
  end

  def step([], _, unplaced), do: unplaced
  def step([h|t], baskets, unplaced) do
    {[h|t], baskets, unplaced} |> IO.inspect()
    case Enum.split_while(baskets, &(&1 < h)) do
      {_left, []} -> step(t, baskets, unplaced+1)
      {left, [x|y]} -> step(t, left ++ y, unplaced)
    end
  end
end

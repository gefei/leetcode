defmodule Solution do
  @spec max_sum(nums :: [integer]) :: integer
  def max_sum(nums) do
    t = nums
      |> Enum.uniq()
      |> Enum.filter(&(&1 > 0))
    if length(t) == 0 do
      nums |> Enum.uniq() |> Enum.max()
    else
      t |> Enum.sum()
    end
  end
end

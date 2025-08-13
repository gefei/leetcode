defmodule Solution do
  @spec min_operations(nums :: [integer]) :: integer
  def min_operations(nums) do
    nums
    |> Enum.chunk_by(&(&1))
    |> Enum.drop_while(&((hd &1) == 1))
    |> length()
  end
end

defmodule Solution do
  @spec find_kth_largest(nums :: [integer], k :: integer) :: integer
  def find_kth_largest(nums, k) do
    h = nums |> Enum.uniq() |> Enum.random()
    head = nums |> Enum.filter(&(&1 < h))
    tail = nums |> Enum.filter(&(&1 >= h))
    len = length(tail)
    cond do
      Enum.all?(nums, &(&1==h)) -> h
      length(nums) == 1 -> hd nums
      len >= k -> find_kth_largest(tail, k)
      len <  k -> find_kth_largest(head, k-len)
    end
  end
end

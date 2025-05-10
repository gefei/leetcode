defmodule Solution do
  @spec min_sum(nums1 :: [integer], nums2 :: [integer]) :: integer
  def min_sum(nums1, nums2) do
    zero_1 = Enum.count(nums1, &(&1 == 0))
    zero_2 = Enum.count(nums2, &(&1 == 0))
    s_1 = Enum.sum(nums1)
    s_2 = Enum.sum(nums2)
    sum_1 = zero_1 + s_1
    sum_2 = zero_2 + s_2
    cond do
      #sum_1 == sum_2 && zero_1 == 0 && zero_2 == 0 -> sum_1
      sum_1 == sum_2 -> sum_1
      sum_1 < sum_2 && zero_1 == 0 -> -1
      sum_1 < sum_2 -> sum_2
      sum_1 > sum_2 && zero_2 == 0 -> -1
      sum_1 > sum_2 -> sum_1
    end
  end
end

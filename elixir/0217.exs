defmodule Solution do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate(nums) do
    uniq = Enum.uniq(nums)
    Enum.count(uniq) != Enum.count(nums)
  end


end


x = Solution.contains_duplicate([1,2,3,1])
IO.inspect(x)
x = Solution.contains_duplicate([1,2,3,4])
IO.inspect(x)
x = Solution.contains_duplicate([1,1,1,3,3,4,3,2,4,2])
IO.inspect(x)

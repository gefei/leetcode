defmodule Solution0167 do
  @spec two_sum(numbers :: [integer], target :: integer) :: [integer]
  def two_sum(numbers, target) do
    x = Enum.with_index(numbers)
    two_sum_rec(x, target)
  end

  def two_sum_rec([h|t] = numbers_with_index, target) do
    {a, i} = h
    IO.inspect({"c", h, t, target})
    other_num = target-a
    other_idx = bin_search(numbers_with_index, other_num, 0, length(numbers_with_index)-1)
    if other_idx == -1 do
      two_sum_rec(t, target)
    else
      other_idx
    end
  end

  def bin_search(numbers_w_index, to_find, l, r) do
    if l > r do
      -1
    else
      mid = div((l+r), 2)
      #IO.inspect({"aa", l, r, mid})
      {a, i} = Enum.at(numbers_w_index, mid)
      cond do
         a == to_find -> mid
         a > to_find ->
          bin_search(numbers_w_index, to_find, l, mid-1)
         a < to_find ->
          bin_search(numbers_w_index, to_find, mid+1, r)
      end
    end
  end

end


x = Solution0167.two_sum([2,7,11,15], 18)
IO.inspect(x)
#x = Solution0167.two_sum([2,7,11,15], 9)
#IO.inspect(x)
#x = Solution0167.two_sum([2,3,4], 6)
#IO.inspect(x)
#x = Solution0167.two_sum([-1,0], -1)
#IO.inspect(x)

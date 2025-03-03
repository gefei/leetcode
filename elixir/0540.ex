defmodule Solution do
  @spec single_non_duplicate(nums :: [integer]) :: integer
  def single_non_duplicate(nums) do
    test(nums)
  end

  def test([h]), do: h
  def test([h|t]) do
    [x|y] = t
    if (h == x) do
      test(y)
    else
      h
    end
  end
end

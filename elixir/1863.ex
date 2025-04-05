defmodule Solution do
  @spec subset_xor_sum(nums :: [integer]) :: integer
  import Bitwise
  def subset_xor_sum(nums) do
    sub_sets(nums, [[]])
    |> Enum.map(&(all_xor(&1)))
    |> Enum.sum
  end

  def sub_sets([], acc), do: acc
  def sub_sets([h|t], acc) do
    sub_sets(t, acc ++ Enum.map(acc, fn x -> [h|x] end))
  end

  def all_xor([]), do: 0
  def all_xor(l) do
    Enum.reduce(l, fn a,b -> bxor(a,b) end)
  end
end

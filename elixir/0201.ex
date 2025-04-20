defmodule Solution do
  import Bitwise
  @spec range_bitwise_and(left :: integer, right :: integer) :: integer
  def range_bitwise_and(left, right) do
    cond do
      right == 0 -> 0
      true -> rec(left, right, "")
    end
  end

  def rec(left, right, acc) do
    cond do
      right == 0
         -> {a, _} = Integer.parse(acc, 2)
            a
      right >  left
         -> rec(left >>> 1, right >>> 1, "0" <> acc)
      right == left && band(left, 1) == 0
         -> rec(left >>> 1, right >>> 1, "0" <> acc)
      right == left && band(left, 1) == 1
         -> rec(left >>> 1, right >>> 1, "1" <> acc)
    end
  end
end

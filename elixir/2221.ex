defmodule Solution2221 do
  @spec triangular_sum(nums :: [integer]) :: integer
  def triangular_sum([h]) do
    rem(h, 10)
  end

  def triangular_sum(nums) do
    len = length(nums)
    bi = bino(len-1)
    nums
    |> Enum.zip(bi)
    |> Enum.map(fn {a, b} -> rem(a*b, 10) end)
    |> Enum.sum()
    |> rem(10)
  end

  def bino(n) do
    [1] |> Stream.concat(
      Stream.unfold(
         {1, 1},
         fn {a, b} -> {div(a*(n-b+1), b), {div(a*(n-b+1), b), b+1}} end
      ))
  end
end

defmodule Solution do
  @spec product_except_self(nums :: [integer]) :: [integer]
  def product_except_self(nums) do
    a = prefix(nums, 1, [1]) |> Enum.reverse()
    b = prefix(Enum.reverse(nums), 1, [1])
    a |> Enum.zip(b) |> Enum.map(fn {a,b} -> a*b end)
  end

  def prefix([h], _cur, acc), do: acc
  def prefix([h|t], cur, acc) do
    prefix(t, cur*h, [cur*h|acc])
  end
end

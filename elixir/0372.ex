defmodule Solution do
  def super_pow(a, b) do
    n = b |> to_dec(0)
    pow(rem(a, 1337), n, 1)
  end

  def to_dec([], acc), do: acc
  def to_dec([h|t], acc) do
    to_dec(t, acc*10+h)
  end

  def pow(a, 0, acc), do: acc
  def pow(a, 1, acc), do: rem(acc * a, 1337)
  def pow(a, n, acc) when rem(n, 2) == 1 do
    rem(pow(rem(a*a, 1337), div(n,2), rem(acc*a, 1337)), 1337)
  end
  def pow(a, n, acc) when rem(n, 2) == 0 do
    rem(pow(rem(a*a, 1337), div(n,2), rem(acc, 1337)), 1337)
  end
end

Solution.to_dec([3], 0) |> IO.inspect()
Solution.to_dec([1,0], 0) |> IO.inspect()
Solution.to_dec([4,3,3,8,5,2], 0) |> IO.inspect()

Solution.super_pow(2, [3]) |> IO.inspect()
Solution.super_pow(2, [1,0]) |> IO.inspect()
Solution.super_pow(2, [4,3,3,8,5,2]) |> IO.inspect()

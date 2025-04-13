defmodule Solution do
  @spec count_good_numbers(n :: integer) :: integer
  def count_good_numbers(n) do
    even = div(n,2)
    odd = n - even
    rem(rem(pow(5, odd), 1000000007) * rem(pow(4, even), 1000000007), 1000000007)
  end

  def pow(_n, 0), do: 1
  def pow(n, 1), do: rem(n, 1000000007)
  def pow(n, k) when rem(k, 2) == 0 do
    y = pow(n, div(k,2))
    rem(y * y, 1000000007)
  end
  def pow(n, k) when rem(k, 2) == 1 do
    y = pow(n, div(k,2))
    rem(y * y * n, 1000000007)
  end
end

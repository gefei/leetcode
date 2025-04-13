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

  def p(_n, 0, acc), do: acc
  def p(n, 1, acc), do: acc * n
  def p(n, k, acc) when rem(k, 2) == 0 do
    p(n*n, div(k,2), acc)
  end
  def p(n, k, acc) when rem(k, 2) == 1 do
    p(n*n, div(k,2), acc*n)
  end
end

Solution.count_good_numbers(1) |> IO.inspect()
Solution.count_good_numbers(4) |> IO.inspect()
Solution.count_good_numbers(50) |> IO.inspect()
Solution.count_good_numbers(806166225460393) |> IO.inspect()

Solution.p(2,5,1) |> IO.inspect()
Solution.p(2,6,1) |> IO.inspect()
Solution.p(2,7,1) |> IO.inspect()
Solution.p(2,8,1) |> IO.inspect()

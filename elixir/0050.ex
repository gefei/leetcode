defmodule Solution do
  def my_pow(x, n) when (n<0) do
    p(1/x, -n, 1)
  end

  def my_pow(x, n) do
    p(x, n, 1)
  end

  def p(_x, 0, acc), do: acc
  def p(x, 1, acc), do: x*acc
  def p(x, k, acc) when rem(k,2) == 0 do
    p(x*x, div(k,2), acc)
  end
  def p(x, k, acc) when rem(k,2) == 1 do
    p(x*x, div(k,2), x*acc)
  end
end

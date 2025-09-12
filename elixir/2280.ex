defmodule Solution do
  @spec minimum_lines(stock_prices :: [[integer]]) :: integer
  def minimum_lines(stock_prices) do
    stock_prices
      |> Enum.sort(fn [a,_], [c, _] -> a < c end)
      |> get_slope([])
      |> Enum.chunk_by(&(&1))
      |> length
  end

  def get_slope([[a,b]], acc), do: acc
  def get_slope([[a,b], [c,d] | t], acc) do
    get_slope([[c,d]|t], [simplify(d-b, c-a) | acc])
  end

  def simplify(a, b) do
   cond do
     a == 0 -> 0
     a > 0 && b > 0 -> {:p, div(a, gcd(a, b)), div(b, gcd(a, b))}
     a < 0 && b < 0 -> {:p, div(-a, gcd(-a, -b)), div(-b, gcd(-a, -b))}
     a > 0 && b < 0 -> {:n, div(a, gcd(a, -b)), div(-b, gcd(a, -b))}
     a < 0 && b > 0 -> {:n, div(-a, gcd(-a, b)), div(b, gcd(-a, b))}
   end
  end

  def gcd(a, 0), do: a
  def gcd(a, b) when a < b, do: gcd(b, a)
  def gcd(a, b), do: gcd(b, rem(a,b))
end

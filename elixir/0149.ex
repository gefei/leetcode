defmodule Solution do
  @spec max_points(points :: [[integer]]) :: integer
  def max_points([_]), do: 1
  def max_points(points) do
    num =
      step(points, []) |> IO.inspect()
      |> Enum.group_by(&(&1))
      |> Enum.map(fn {_,b} -> length(b) end)
      |> Enum.max()
    trunc(:math.sqrt(num*2)) + 1
  end

  def step([_h], acc), do: acc
  def step([h|t], acc) do
    step(t, collect(h, t, acc))
  end

  def collect(h, [], acc), do: acc
  def collect(h, [a|b], acc) do
    collect(h, b, [get_line(h, a)|acc])
  end

  def get_line([a,b], [a,d]), do: {:x, a}
  def get_line([a,b], [c,d]) do
    {p, q} = simplify(d-b, c-a)
    r = simplify(q*b - p*a, q)
    {:m, {p, q}, :t, r}
  end

  def simplify(a, b) do
   cond do
     a == 0 -> {0, 1}
     a > 0 && b > 0 -> {div(a, gcd(a, b)), div(b, gcd(a, b))}
     a < 0 && b < 0 -> {div(-a, gcd(-a, -b)), div(-b, gcd(-a, -b))}
     a > 0 && b < 0 -> {-div(a, gcd(a, -b)), div(-b, gcd(a, -b))}
     a < 0 && b > 0 -> {-div(-a, gcd(-a, b)), div(b, gcd(-a, b))}
   end
  end

  def gcd(a, 0), do: a
  def gcd(a, b) when a < b, do: gcd(b, a)
  def gcd(a, b), do: gcd(b, rem(a,b))
end

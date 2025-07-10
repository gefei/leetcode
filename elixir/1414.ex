defmodule Solution do
  def fibo() do
    Stream.unfold(
      {1,1},
      fn {a,b} -> {a, {b, a+b}} end)
  end

  def find_min_fibonacci_numbers(k) do
    fibo()
      |> Enum.take_while(&(&1 <= k))
      |> Enum.reverse()
      |> then(&(step(k, &1, 0)))
  end

  def step(k, candis, acc) when k == 0, do: acc
  def step(k, candis, acc) do
    can = [h|t] = candis |> Enum.drop_while(&(&1 > k))
    d = k - h
    step(d, can, acc+1)
  end
end

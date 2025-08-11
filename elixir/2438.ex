defmodule Solution do
  use Bitwise

  def product_queries(n, queries) do
    m = get_map(0, 1, Map.new())
    arr = to_array(n, 0, [])
    partial_sum = Enum.scan(arr, fn a,b -> a+b end)
    step(queries, partial_sum, []) |> Enum.map(&(Map.get(m, &1)))
  end

  def get_map(pow, r, acc) when pow > 500, do: acc
  def get_map(pow, r, acc) do
    m = 1_000_000_007
    new_r = rem(r*2, m)
    get_map(pow+1, new_r, Map.put(acc, pow, r))
  end

  def step([], _partial_sum, acc), do: acc |> Enum.reverse()
  def step([[a,b]|t], partial_sum, acc) do
    to_sub = if (a==0) do 0 else Enum.at(partial_sum, a-1) end
    s = Enum.at(partial_sum, b) - to_sub
    step(t, partial_sum, [s|acc])
  end

  def to_array(0, _cur, acc), do: Enum.reverse(acc)
  def to_array(n, cur, acc) do
    cond do
      band(n, 1) == 1 -> to_array(n >>> 1, cur+1, [cur|acc])
      true -> to_array(n >>> 1, cur+1, acc)
    end
  end
end

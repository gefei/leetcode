defmodule Solution do
  @spec num_trees(n :: integer) :: integer
  def num_trees(n) do
    cond do
      n == 0 -> 1
      n == 1 -> 1
      true ->
        m = %{0=>1, 1=>1}
        t = map(2, n, m)
        Map.get(t, n)
    end
  end

  def map(i, n, m) when i > n, do: m
  def map(i, n, m) do
    this_one = loop(0, i, m, 0)
    new_m = Map.put(m, i, this_one)
    map(i+1, n, new_m)
  end

  def loop(cur, i, map, acc) do
    k = i - cur - 1
    cond do
      cur > k -> acc
      cur == k -> Map.get(map, k) * Map.get(map, cur) + acc
      true -> loop(cur+1, i, map, acc+Map.get(map, k)*Map.get(map, cur)*2)
    end
  end
end

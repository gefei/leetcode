defmodule Solution do
  @spec number_of_submatrices(grid :: [[char]]) :: integer
  def number_of_submatrices(grid) do
    up_map = Enum.map((hd grid), fn _a -> Map.new() end)
    process_grid(grid, up_map, 0)
  end

  # [[char]] -> [map] -> num
  def process_grid([], _up_map, acc), do: acc
  def process_grid([h|t], up_map, acc) do
    row_map = process_row(h, Map.new(), [])
    new_up_map =
      Enum.zip_with([row_map, up_map], fn [a,b] -> Map.merge(a, b, fn _k, v1, v2 -> v1 + v2 end) end)
    c = Enum.count(new_up_map, fn m -> ok(m) end)
    process_grid(t, new_up_map, acc+c)
  end

  def ok(m) do
     Map.get(m, ?X, 0) > 0 && Map.get(m, ?Y, 0) == Map.get(m, ?X, 0)
  end

  # [char] -> map -> [map]
  def process_row([], _cur, acc), do: acc |> Enum.reverse()
  def process_row([h|t], cur, acc) do
    c = Map.get(cur, h, 0)
    new_map = Map.put(cur, h, c+1)
    process_row(t, new_map, [new_map|acc])
  end
end

defmodule Solution do
  @spec check_valid_cuts(n :: integer, rectangles :: [[integer]]) :: boolean
  def check_valid_cuts(n, rectangles) do
    x_coords = rectangles |> Enum.map(fn [a, _b, c, _d] -> {a, c} end)
    cond do
         ok(x_coords) -> true
         true -> y_coords = rectangles |> Enum.map(fn [_a, b, _c, d] -> {b, d} end)
                 ok(y_coords)
    end
  end

  def ok(coords) do
      c = coords |> Enum.sort_by(fn {a,_b} -> a end)
      length(merge(c, hd(c), [])) >= 3
  end

  def merge([], cur, acc) do
    [cur|acc]
  end

  def merge([{a,b}|t], {x,y}, acc) do
    cond do
      a < y -> merge(t, {x, Enum.max([b, y])}, acc)
      true  -> merge(t, {a,b}, [{x,y}|acc])
    end
  end
end

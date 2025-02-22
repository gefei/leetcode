defmodule Solution do
  @spec max_product(words :: [String.t]) :: integer
  def max_product(words) do
    lst = words
    |> Enum.map(&(String.length(&1)))
    |> Enum.zip(words |> Enum.map(&(&1 |> String.to_charlist() |> MapSet.new())))
    prods = for {x1, x2} <- lst, {y1, y2} <- lst, (MapSet.disjoint?(x2, y2)) do
              x1 * y1
            end
    if (length(prods) == 0) do 0 else Enum.max(prods) end
  end
end

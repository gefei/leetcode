defmodule Solution do
  @spec last_non_empty_string(s :: String.t) :: String.t
  def last_non_empty_string(s) do
    freq = (lst = s |> to_char_list()) |> Enum.frequencies()
    {_, mx} = freq |> Enum.max_by(fn {_a, b} -> b end)
    letters = freq |> Enum.filter(fn {_, b} -> b == mx end) |> Enum.map(fn {a, b} -> a end)
    map = last_occurance(Enum.reverse(lst), length(lst)-1, Map.new())
    letters |> Enum.sort_by(fn c -> Map.get(map, c) end) |> List.to_string()
  end

  def last_occurance([], _, acc), do: acc
  def last_occurance([h|t], _, acc) when map_size(acc) == 26, do: acc
  def last_occurance([h|t], pos, acc) do
    case  Map.get(acc, h, nil) do
      nil -> last_occurance(t, pos-1, Map.put(acc, h, pos))
      _ -> last_occurance(t, pos-1, acc)
    end
  end
end

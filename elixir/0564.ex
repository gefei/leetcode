defmodule Solution do
  @spec nearest_palindromic(n :: String.t) :: String.t
  def nearest_palindromic(n) do
    list = String.to_charlist(n)
    num = String.to_integer(n)
    len = length(list)
    cond do
      len == 1 ->
        (num - 1) |> Integer.to_string()
      rem(len, 2) == 1 ->
        half = div(len, 2)
        {left, rest} = list |> Enum.split(half)
        mid = rest |> Enum.take(1)
        num_1 = (((left ++ mid) |> List.to_integer()) + 1) |> to_palin(len)
        num_2 = (left ++ mid) |> List.to_integer() |> to_palin(len)
        num_3 = (((left ++ mid) |> List.to_integer()) - 1) |> to_palin(len)
        num_down = (1..len-1) |> Enum.into([], fn _ -> ?9 end) |> List.to_integer()
        num_up = ([?1 | (1..len-1) |> Enum.into([], fn _ -> ?0 end)] ++ [?1]) |> List.to_integer()
        diffs = if is_palin(list) do [num_1, num_3, num_down, num_up] else [num_1, num_2, num_3, num_down, num_up] end
        diffs
        |> Enum.sort_by(fn x -> abs(x-num) end)
        |> Enum.chunk_by(fn x -> abs(x-num) end)
        |> hd
        |> Enum.min() |> Integer.to_string()
      true ->
        half = div(len, 2)
        left = list |> Enum.take(half)
        num_1 = ((left  |> List.to_integer()) + 1) |> to_palin(len)
        num_2 = left |> List.to_integer() |> to_palin(len)
        num_3 = ((left  |> List.to_integer()) - 1) |> to_palin(len)
        num_down = (1..len-1) |> Enum.into([], fn _ -> ?9 end) |> List.to_integer()
        num_up = ([?1 | (1..len-1) |> Enum.into([], fn _ -> ?0 end)] ++ [?1]) |> List.to_integer()
        diffs = if is_palin(list) do [num_1, num_3, num_down, num_up] else [num_1, num_2, num_3, num_down, num_up] end
        diffs
        |> Enum.sort_by(fn x -> abs(x-num) end)
        |> Enum.chunk_by(fn x -> abs(x-num) end)
        |> hd
        |> Enum.min() |> Integer.to_string()
    end
  end

  def is_palin(list) do
    list == Enum.reverse(list)
  end

  def to_palin(n, len) do
    list = Integer.to_string(n) |> String.to_charlist()
    rest = cond do
      len-length(list) == length(list) -> Enum.reverse(list)
      true -> tl (Enum.reverse(list))
    end
    (list ++ rest) |> List.to_integer()
  end
end

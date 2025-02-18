defmodule Solution do
  @spec di_string_match(s :: String.t) :: [integer]
  def di_string_match(s) do
    [h|t] = s
      |> String.to_charlist()
      |> Enum.chunk_by(&(&1))
      |> Enum.map(&({hd(&1), length(&1)}))
    {ch, len} = h
    if (ch == ?I) do
      rec([h|t], 1, 1, [0])
    else
      rec([h|t], -1, 0, [len])
    end
  end

  def rec([], _min, _cur, acc), do: acc

  def rec([{ch, len}], min, cur, acc) do
    if (ch == ?I) do
      range = if (len > 1) do
         [min] ++ Enum.to_list(cur+1 .. cur+len-1)
      else
         [min]
      end
      new_str = range
        |> Enum.map(&(&1))
      acc ++ new_str
    else # ch == ?D
      range = cur+len-1 .. cur
      new_str = range
        |> Enum.map(&(&1))
      acc ++ new_str
    end
  end

  def rec([{ch, len}| [{c1, len1}|t]], min, cur, acc) do
    if (ch == ?I) do
      range = if (len > 1) do
        Enum.to_list(cur .. cur+len-2) ++ [cur+len1+len-1]
      else
        [cur+len1]
      end
      new_str = range
        |> Enum.map(&(&1))
      rec([{c1, len1}|t], min, cur+len-1, acc ++ new_str)
    else # ch == ?D
      range = cur+len-1 .. cur
      new_str = range
        |> Enum.map(&(&1))
      rec([{c1, len1}|t], cur+len+1, cur+len+1, acc ++ new_str )
    end
  end
end

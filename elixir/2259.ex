defmodule Solution do
  #@spec remove_digit(number :: String.t, digit :: char) :: String.t
  def remove_digit(number, digit) do
    d = digit - 48
    IO.inspect(d)
    [h|t] =
      number
      |> String.to_charlist()
      |> Enum.map(&(&1-48))
    z = [h|t]|> Enum.zip(t ++ [0])
      |> Enum.with_index()
      |> Enum.filter(fn {{a,_}, _} -> a == d end)
    up = z |> Enum.filter(fn {{a,b}, _} -> a < b end)
    if (up == []) do
      down  = z |> Enum.filter(fn {{a,b}, _} -> a > b end) |> IO.inspect()
      {_, i} = Enum.at(down, -1)
      (number |> String.slice(0, i)) <> (number |> String.slice(i+1, String.length(number)))
    else
      {_, i} = Enum.at(up, 0)
      (number |> String.slice(0, i)) <> (number |> String.slice(i+1, String.length(number)))
    end
  end
end

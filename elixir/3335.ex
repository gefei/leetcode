defmodule Solution do
  def length_after_transformations(s, t) do
    lst = String.to_charlist(s)
    freq = Enum.frequencies(lst)
    res = rec(t, freq)
    {_, b} = Enum.reduce(res, fn {x,y}, {a,b} -> {0, y+b} end)
    rem(b, 1000000007)
  end

  def rec(0, acc), do: acc
  def rec(t, acc) do
    z = Map.get(acc, ?z, 0) #|> IO.inspect()
    new_freq =
      Map.new(acc, fn {a,b} -> {a+1, b} end) #|>  IO.inspect()
      |> Map.delete(?z+1) #|> IO.inspect(charlists: :as_charlists)
    b = Map.get(new_freq, ?b, 0)
    x = Map.put(new_freq, ?a, z) |> Map.put(?b, z+b)
    rec(t-1, x)
  end
end

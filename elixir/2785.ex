defmodule Solution do
  @spec sort_vowels(s :: String.t) :: String.t
  def sort_vowels(s) do
    lst = String.to_charlist(s)
    vowels = lst |> Enum.filter(&(is_vowel(&1))) |> Enum.sort()
    groups = lst |> Enum.chunk_by(&(is_vowel(&1)))
    rec(groups, vowels, "")
  end

  def rec([], _, acc), do: acc
  def rec([h|t], vowels, acc) do
    cond do
      is_vowel(Enum.at(h, 0)) -> true
          len = length(h)
          rest_vowels = Enum.drop(vowels, len)
          prefix = Enum.take(vowels, len) |> Enum.map(&(<<&1>>)) |> Enum.join()
          rec(t, rest_vowels,  acc <> prefix)
      true -> rec(t, vowels, acc <> List.to_string(h))
    end
  end

  def is_vowel(c) do
    (c == ?A || c == ?a)
      || (c == ?E || c == ?e)
      || (c == ?I || c == ?i)
      || (c == ?O || c == ?o)
      || (c == ?U || c == ?u)
  end
end

Solution.sort_vowels(("lEetcOde")) |> IO.inspect()

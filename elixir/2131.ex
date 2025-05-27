defmodule Solution do
  use Bitwise
  @spec longest_palindrome(words :: [String.t]) :: integer
  def longest_palindrome(words) do
    same = words |> Enum.filter(fn s -> String.at(s, 0) == String.at(s, 1) end)
    diff = words |> Enum.filter(fn s -> String.at(s, 0) != String.at(s, 1) end)
    same_freq = same |> Enum.frequencies()
    diff_freq = diff |> Enum.frequencies()

      diff_dup = Enum.reduce(diff_freq, 0,
      fn {a,b}, acc ->
        Enum.min([b, Map.get(diff_freq, String.reverse(a), 0)]) + acc
      end
      )
      same_dup =
        Enum.reduce(same_freq, 0,
          fn {a, b}, acc ->
            acc +  ((b >>> 1) <<< 1)
          end
        ) + rec(Map.values(same_freq))
      (diff_dup + same_dup)*2
  end

  def rec([]), do: 0
  def rec([h|t]) do
    if ((h &&& 1) == 1) do
      1
    else
      rec(t)
    end
  end
end

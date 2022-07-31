defmodule Solution do
  @spec longest_common_prefix(strs :: [String.t]) :: String.t
  def longest_common_prefix(strs) do
     x = min_length(strs)
     s = 0..x-1 |> Enum.take_while(fn n -> all_same(strs, n) end)
     [a0 | _] = strs
     String.slice(a0, 0, Enum.count(s))
  end

  def all_same(strs, n) do
    all = strs |> Stream.map(fn s -> String.slice(s, n, 1) end)
    [c | _] = Enum.to_list(all)
    b = all |> Stream.map(fn d -> d == c end)
    e = b |> Enum.reduce(fn (a, b) -> a and b end)
    e
  end

  def min_length(strs) do
    strs |> Stream.map(fn s -> String.length(s) end) |> Enum.min
  end
end

a = ["flower", "flow", "flight"]
#a = ["dog", "racecar", "car"]
x = Solution.longest_common_prefix(a)


IO.inspect x

defmodule Solution do
  @spec group_anagrams(strs :: [String.t]) :: [[String.t]]
  def group_anagrams(strs) do
    groups = Enum.group_by(strs, fn n -> canonical(n) end)
    groups |> Enum.map(fn {k, v} -> v end)
  end

  def canonical(s) do
    String.graphemes(s) |> Enum.sort
  end
end

x = Solution.group_anagrams(["eat", "tea", "ate", "nat", "bat"]) 
IO.inspect x
x = Solution.group_anagrams([""]) 
IO.inspect x
x = Solution.group_anagrams(["a"]) 
IO.inspect x

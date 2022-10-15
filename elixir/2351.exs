defmodule Solution do
  @spec repeated_character(s :: String.t) :: char
  def repeated_character(s) do
    {a, b} = String.to_charlist(s)
      |> Enum.with_index
      |> Enum.group_by(fn {c, _} -> c end, fn {_, i} -> i end)
      |> Enum.filter(fn {c, lst} -> length(lst) > 1 end)
      |> Enum.map(fn {a, [h|[h1| t1]]} -> {a, h1} end)
      |> Enum.min_by(fn {a, b} -> b end)
    a
  end
end


x = Solution.repeated_character("abccbaacz")
IO.inspect(x)
x = Solution.repeated_character("abcdd")
IO.inspect(x)

defmodule Solution0387 do
  @spec first_uniq_char(s :: String.t) :: integer
  def first_uniq_char(s) do
    res = String.to_charlist(s)
      |> Enum.with_index()
      |> Enum.group_by(fn {a, _} -> a end , fn {_, b} -> b end)
      |> Enum.filter(fn {a, l} -> length(l) == 1 end)
    case res do
      [] -> -1
      _ ->
       {a, [b]} = res |> Enum.min_by(fn {a, b} -> b end)
       b
    end
  end
end


x = Solution0387.first_uniq_char("leetcode")
IO.inspect(x)
x = Solution0387.first_uniq_char("loveleetcode")
IO.inspect(x)
x = Solution0387.first_uniq_char("aabb")
IO.inspect(x)

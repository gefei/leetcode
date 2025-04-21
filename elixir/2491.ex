defmodule Solution do
  @spec divide_players(skill :: [integer]) :: integer
  def divide_players(skill) do
    s = Enum.sort(skill)
    len = length(s)
    rec(s, Enum.reverse(s), 0, len, div(Enum.sum(s)*2, len), 0)
  end

  def rec([h1|t1], [h2|t2], idx, len, target, acc) do
    cond do
      idx == div(len,2) -> acc
      h1 + h2 != target -> -1
      true -> rec(t1, t2, idx+1, len, target, acc+h1*h2)
    end
  end
end

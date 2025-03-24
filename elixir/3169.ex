defmodule Solution do
  @spec count_days(days :: integer, meetings :: [[integer]]) :: integer
  def count_days(days, meetings) do
    meetings
    |> Enum.sort_by(fn [a, _b] -> a end) |> IO.inspect()
    |> count(1, days, 0)
  end

  def count([], cur_day, days, acc), do: acc + days-cur_day+1
  def count([[a,b]|t], cur_day, days, acc) do
    {[[a,b]|t], cur_day, days, acc}
    cond do
      cur_day >= a && cur_day <= b -> count(t, b+1, days, acc)
      cur_day >= b                 -> count(t, cur_day, days, acc)
      true                         -> count(t, b+1, days, acc+a-cur_day)
    end
  end
end

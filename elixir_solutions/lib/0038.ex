defmodule Solution0038 do
  def count_and_say(1), do: "1"
  def count_and_say(n) do
    tail_count_and_say(1, n, "1")
  end
  def tail_count_and_say(m, n, acc) when m == n, do: acc
  def tail_count_and_say(m, n, acc) do
    tail_count_and_say(m+1, n, say(acc))
  end
  def say(s) do
    groups = run_length(String.graphemes(s))
    collect(groups)
  end
  def run_length(list), do: tail_run_length(list, [])
  def tail_run_length([], acc), do: acc
  def tail_run_length([h|t], acc) do
    next_run = Enum.take_while([h|t], fn x -> x == h end)
    rest = Enum.drop_while([h|t], fn x -> x == h end)
    tail_run_length(rest, acc ++ [{h, Enum.count(next_run)}])
  end
  def collect(list), do: tail_collect(list, "")
  def tail_collect([], acc), do: acc
  def tail_collect([{a,b}|t], acc) do
    tail_collect(t, acc <> to_string(b) <> to_string(a))
  end
end

defmodule Solution do
  @spec min_operations(queries :: [[integer]]) :: integer
  def min_operations(queries) do
    query_loop(queries, 0)
  end

  def query_loop([], acc), do: acc
  def query_loop([h|t], acc) do
    query_loop(t, answer_query(h)+acc)
  end

  def answer_query(q) do
    {a, b} = {Enum.at(q, 0), Enum.at(q, -1)}
    {num_a, num_b} = {get_steps(a), get_steps(b)}
    {a_next, b_last} = {trunc(:math.pow(4, num_a)), trunc(:math.pow(4, num_b-1))}
    cond do
      num_a == num_b ->
        cnt = b - a + 1
        div(cnt * num_b, 2) + rem(cnt * num_b, 1)
      true ->
        {cnt_a, cnt_b} = {a_next - a, b - b_last + 1}
        cnt = cnt_a*num_a + cnt_b*num_b
        cnt_middle = get_count(num_a+1, num_b-1, 0)
        div(cnt + cnt_middle, 2) + rem(cnt+cnt_middle, 2)
    end
  end

  def get_count(n, b, acc) when n > b, do: acc
  def get_count(n, b, acc) do
    d = (trunc(:math.pow(4, n)) - trunc(:math.pow(4, n-1))) * n
    get_count(n+1, b, acc+d)
  end

  def get_steps(n) do
    trunc(:math.log(n) / :math.log(4)) + 1
  end
end

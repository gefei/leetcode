defmodule Solution do
  @spec get_descent_periods(prices :: [integer]) :: integer
  def get_descent_periods([h|t]=prices) do
    step(t, (hd prices), 1, 0)
  end

  def step([], _cur_num, cur_len, acc) do
    acc+div(cur_len*(cur_len+1), 2)
  end
  def step([h|t], cur_num, cur_len, acc) do
    cond do
      h == cur_num-1 ->
        step(t, h, cur_len+1, acc)
      true ->
        step(t, h, 1, acc+div(cur_len*(cur_len+1), 2))
    end
  end
end

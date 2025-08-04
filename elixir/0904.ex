defmodule Solution do
  @spec total_fruit(fruits :: [integer]) :: integer
  def total_fruit(fruits) do
    step(fruits, -1, 0, -1, 0, 0, 0, 0, 0)
  end

  def step([], _a_val, _a_cnt, _b_val, _b_cnt, _after_a, _after_b, cur, acc) do
    if cur > acc do cur else acc end
  end

  def step([h|t], a_val, a_cnt, b_val, b_cnt, after_a, after_b, cur, acc) do
    cond do
      a_cnt == 0 -> step(t, h, 1, b_val, b_cnt, 0, 0, cur+1, acc)
      h == a_val -> step(t, a_val, a_cnt+1, b_val, b_cnt, 0, after_b+1, cur+1, acc)
      b_cnt == 0 -> step(t, a_val, a_cnt, h, 1, after_a+1, 0, cur+1, acc)
      h == b_val -> step(t, a_val, a_cnt, b_val, b_cnt+1, after_a+1, 0, cur+1, acc)
      true ->
        new_acc = if b_cnt + a_cnt > acc do b_cnt + a_cnt else acc end
        if after_b == 0 do
          step(t, b_val, after_a, h, 1, 1, 0, after_a+1, new_acc)
        else
          step(t, a_val, after_b, h, 1, 1, 0, after_b+1, new_acc)
        end
    end
  end
end

defmodule Solution do
  @spec value_after_k_seconds(n :: integer, k :: integer) :: integer
  def value_after_k_seconds(n, k) do
    step(k+1, n, 0, 1) |> rem(1_000_000_007)
  end

  def step(_k, n, cur_n, acc) when n-1 == cur_n, do: acc
  def step(k, n, cur_n, acc) do
    new_acc = k*acc |> div(cur_n+1)
    step(k+1, n, cur_n+1, new_acc)
  end
end

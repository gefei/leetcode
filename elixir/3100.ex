defmodule Solution do
  @spec max_bottles_drunk(num_bottles :: integer, num_exchange :: integer) :: integer
  def max_bottles_drunk(num_bottles, num_exchange) do
    step(num_bottles, 0, num_exchange, 0)
  end

  def step(0, empty, num_exchange, acc) when empty >= num_exchange do
    step(1, empty-num_exchange, num_exchange+1, acc)
  end
  def step(0, _e, _n, acc), do: acc
  def step(full, empty, num_exchange, acc) do
    step(0, empty+full, num_exchange, acc+full)
  end
end

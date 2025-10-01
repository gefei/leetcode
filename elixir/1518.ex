defmodule Solution do
  @spec num_water_bottles(num_bottles :: integer, num_exchange :: integer) :: integer
  def num_water_bottles(num_bottles, num_exchange) do
    step(num_bottles, 0, num_exchange, num_bottles)
  end

  def step(0, _e, _num_exchange, acc), do: acc
  def step(full, empty, num_exchange, acc) do
    new_empty = rem(full+empty, num_exchange)
    new_full = div(full+empty, num_exchange)
    step(new_full, new_empty, num_exchange, acc+new_full)
  end
end

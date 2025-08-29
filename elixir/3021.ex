defmodule Solution do
  @spec flower_game(n :: integer, m :: integer) :: integer
  def flower_game(n, m) do
    num_odd(n)*num_even(m) + num_even(n)*num_odd(m)
  end

  def num_odd(n), do: div(n,2) + rem(n,2)
  def num_even(n), do: div(n,2)
end

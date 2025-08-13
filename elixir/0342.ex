defmodule Solution do
  @spec is_power_of_four(n :: integer) :: boolean
  def is_power_of_four(n) do
    cond do
      n <= 0 -> false
      n == 1 -> true
      rem(n, 4) != 0 -> false
      true -> is_power_of_four(div(n,4))
    end
  end
end

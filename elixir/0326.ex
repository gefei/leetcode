defmodule Solution do
  @spec is_power_of_three(n :: integer) :: boolean
  def is_power_of_three(n) do
    cond do
      n <= 0 -> false
      n == 1 -> true
      rem(n, 3) != 0 -> false
      true -> is_power_of_three(div(n,3))
    end
  end
end

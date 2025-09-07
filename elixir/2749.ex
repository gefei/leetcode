defmodule Solution do
  use Bitwise
  @spec make_the_integer_zero(num1 :: integer, num2 :: integer) :: integer
  def make_the_integer_zero(num1, num2) do
      step(num1, num2, 0)
  end

  def step(num1, num2, acc) do
    n = num1 - num2
    cond do
      n < acc+1 -> -1
      true ->
        cnt_1 = count_1(n, 0)
        if cnt_1 <= acc+1 and n != 0 do
          acc+1
        else
          step(n, num2, acc+1)
        end
    end
  end

  def count_1(0, acc), do: acc
  def count_1(n, acc), do: count_1(n >>> 1, acc+rem(n, 2))
end

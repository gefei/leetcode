defmodule Solution do
  @spec last_remaining(n :: integer) :: integer
  def last_remaining(n) do
    left(n)
  end

  def left(1), do: 1
  def left(n) when rem(n,2) == 1, do: left(n-1)
  def left(n) when rem(n,2) == 0, do: right(n)

  def right(n) do
    x = left(div(n, 2))
    n+2 - x*2
  end
end

defmodule Solution0069 do
  @spec my_sqrt(x :: integer) :: integer
  def my_sqrt(x) do
    y = Stream.unfold(1, fn n -> {n, n + 1} end)
    [h] = y |> Enum.take_while(fn a -> a*a <= x end) |> Enum.take(-1)
    h
  end
end

x = Solution0069.my_sqrt(8)
IO.inspect x
x = Solution0069.my_sqrt(9)
IO.inspect x

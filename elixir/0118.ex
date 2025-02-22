defmodule Solution do
  @spec generate(num_rows :: integer) :: [[integer]]
  def generate(num_rows) do
    1..num_rows
    |> Enum.map(&(bino(&1-1) |> Enum.take(&1)))
  end

  def bino(n) do
    [1] |> Stream.concat(
      Stream.unfold(
         {1, 1},
         fn {a, b} -> {div(a*(n-b+1), b), {div(a*(n-b+1), b), b+1}} end
      ))
  end
end

Solution.generate(5) |> IO.inspect()
Solution.generate(1) |> IO.inspect()

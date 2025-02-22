defmodule Solution do
  @spec get_row(row_index :: integer) :: [integer]
  def get_row(row_index) do
    bino(row_index) |> Enum.take(row_index+1)
  end

  def bino(n) do
    [1] |> Stream.concat(
      Stream.unfold(
         {1, 1},
         fn {a, b} -> {div(a*(n-b+1), b), {div(a*(n-b+1), b), b+1}} end
      ))
  end
end

defmodule Solution do
  @spec count_homogenous(s :: String.t) :: integer
  def count_homogenous(s) do
    String.graphemes(s)
    |> Enum.chunk_by(fn a  -> a end)
    |> Enum.map(fn a -> length(a) end)
    |> Enum.map(fn a -> div(a * (a+1), 2) end)
    |> Enum.sum()
    |> rem(1000000007)
  end
end

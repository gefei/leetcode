defmodule Solution do
  @spec min_flips(target :: String.t) :: integer
  def min_flips(target) do
    target
    |> String.to_charlist()
    |> Enum.chunk_by(&(&1))
    |> Enum.drop_while(&((hd &1) == ?0))
    |> length()
  end
end

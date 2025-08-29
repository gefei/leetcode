defmodule Solution do
  @spec count_substrings(s :: String.t, c :: char) :: integer
  def count_substrings(s, c) do
    x = s
        |> String.to_charlist()
        |> Enum.count(&(&1 == c))
    div(x*(x+1), 2)
  end
end

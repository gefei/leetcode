defmodule Solution do
  @spec possible_string_count(word :: String.t) :: integer
  def possible_string_count(word) do
    nums =
      word
      |> String.to_charlist()
      |> Enum.chunk_by(&(&1))
      |> Enum.map(&(length(&1)))
      |> Enum.filter(&(&1>1))
    Enum.sum(nums) - length(nums) + 1
  end
end

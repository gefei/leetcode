defmodule Solution do
  @spec number_game(nums :: [integer]) :: [integer]
  def number_game(nums) do
    nums
    |> Enum.sort()
    |> take_two([])
  end

  def take_two([], acc) do
    acc
  end
  def take_two([a|[b|rest]], acc) do
    take_two(rest, acc++[b, a])
  end
end

IO.inspect(Solution.number_game([5,4,2,3]))
IO.inspect(Solution.number_game([2,5]))

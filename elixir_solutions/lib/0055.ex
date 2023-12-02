defmodule Solution0055 do
  @spec can_jump(nums :: [integer]) :: boolean
  def can_jump(nums) do
    can_jump(nums, 0, Enum.at(nums, 0))
  end

  def can_jump(nums, current, reachable) when current >= reachable do
    #IO.inspect({current, reachable, false})
    current >= length(nums) - 1
  end
  def can_jump(nums, current, reachable) do
    #IO.inspect({current, reachable})
    l = length(nums) - 1
    if reachable >= l do
      true
    else
      next = current + 1
      next_reachable =
        [Enum.at(nums, next) + next, reachable]
        |> Enum.max
      can_jump(nums, next, next_reachable)
    end
  end
end

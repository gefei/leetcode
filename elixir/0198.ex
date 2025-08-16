defmodule Solution do
  @spec rob(nums :: [integer]) :: integer
  def rob(nums) do
    step((tl nums), (hd nums), 0)
  end

  def step([], a, b), do: a
  def step([h|t], a, b) do
    cond do
      h+b > a -> step(t, h+b, a)
      true -> step(t, a, a)
    end
  end
end

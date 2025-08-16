defmodule Solution do
  @spec rob(nums :: [integer]) :: integer
  def rob(nums) do
    case nums do
      [h] -> h
      [_a, _b] -> Enum.max(nums)
      [a | [_b | t] = tail] ->
        x = no_ring(tail)
        y = no_ring([a | Enum.take(tail, length(tail)-1)])
        Enum.max([x, y])
    end
  end

  def no_ring(nums) do
    step((tl nums), (hd nums), 0)
  end

  def step([], a, _b), do: a
  def step([h|t], a, b) do
    cond do
      h+b > a -> step(t, h+b, a)
      true -> step(t, a, a)
    end
  end
end

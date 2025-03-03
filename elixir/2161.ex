defmodule Solution do
  @spec pivot_array(nums :: [integer], pivot :: integer) :: [integer]
  def pivot_array(nums, pivot) do
    step(nums, pivot, [], [], [])
  end

  def step([], _pivot, l, e, g), do: Enum.reverse(l) ++ Enum.reverse(e) ++ Enum.reverse(g)
  def step([h|t], pivot, l, e, g) do
    cond do
      h < pivot  -> step(t, pivot, [h|l], e, g)
      h > pivot  -> step(t, pivot, l, e, [h|g])
      h == pivot  -> step(t, pivot, l, [h|e], g)
    end
  end
end

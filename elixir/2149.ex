defmodule Solution do
  @spec rearrange_array(nums :: [integer]) :: [integer]
  def rearrange_array(nums) do
    {p, n} = step(nums, [], []) |> IO.inspect()
    concat(p, n, [])
  end

  def step([], p, n), do: {p, n}
  def step([h|t], p, n) do
    cond do
      h>0 -> step(t, [h|p], n)
      h<0 -> step(t, p, [h|n])
    end
  end

  def concat([], [], acc), do: acc
  def concat([h1|t1], [h2|t2], acc) do
    concat(t1, t2, [h1|[h2|acc]])
  end
end

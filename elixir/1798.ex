defmodule Solution do
  @spec get_maximum_consecutive(coins :: [integer]) :: integer
  def get_maximum_consecutive(coins) do
    step(Enum.sort(coins), 0)
  end

  def step([], acc), do: acc + 1
  def step([h|t], acc) do
    cond do
      h <= acc+1 -> step(t, acc+h)
      true -> acc + 1
    end
  end
end

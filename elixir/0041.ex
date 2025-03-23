defmodule Solution do
  @spec first_missing_positive(nums :: [integer]) :: integer
  def first_missing_positive(nums) do
    pos = nums |> Enum.filter(&(&1>0)) |> MapSet.new() |> Enum.to_list()
    min_from(1, pos)
  end

  def min_from(a, []), do: a
  def min_from(a, q) do
    n = length(q)
    b = a + 1 + div(n, 2)
    {us, vs} = Enum.split_with(q, &(&1 < b))
    if (b-a == length(us)) do
      min_from(b, vs)
    else
      min_from(a, us)
    end
  end
end

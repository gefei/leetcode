defmodule Solution do
  @spec check_arithmetic_subarrays(nums :: [integer], l :: [integer], r :: [integer]) :: [boolean]
  def check_arithmetic_subarrays(nums, l, r) do
    step(nums, l, r, [])
  end

  def step(nums, [], [], acc), do: acc |> Enum.reverse()
  def step(nums, [a|t1], [b|t2], acc) do
    [a,b|t] = slice = nums |> Enum.drop(a) |> Enum.take(b-a+1) |> Enum.sort()
    slice |> IO.inspect(charlists: :as_list)
    step(nums, t1, t2, [is_arithmetic(slice, b-a) | acc])
  end

  def is_arithmetic([a,b], d), do: b-a == d
  def is_arithmetic([h,h1|t], d) do
    cond do
      h1 - h == d -> is_arithmetic([h1|t], d)
      true -> false
    end
  end
end

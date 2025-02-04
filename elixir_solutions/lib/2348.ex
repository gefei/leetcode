defmodule Solution do
  @spec zero_filled_subarray(nums :: [integer]) :: integer
  def zero_filled_subarray(nums) do
    rec(nums, 0, [])
    |> Enum.map(fn x -> div(x*(x+1), 2) end)
    |> Enum.sum
  end

  def rec([], cur, acc) do [cur|acc] end

  def rec([h|t], cur, acc) do
    cond do
      h == 0 -> rec(t, cur+1, acc)
      true -> rec(t, 0, [cur|acc])
    end
  end
end

defmodule Solution do
  @spec num_of_subarrays(arr :: [integer]) :: integer
  def num_of_subarrays(arr) do
    [h|t] = arr
    if (rem(h,2) == 0) do
      rec(t, 0, 1, 0)
    else
      rec(t, 1, 0, 1)
    end
  end

  def rec([], this_odd, this_even, c_odd), do: c_odd

  def rec([h|t], this_odd, this_even, c_odd) when rem(h, 2) == 0 do
    rec(t, this_odd, this_even+1, c_odd+this_odd)
  end

  def rec([h|t], this_odd, this_even, c_odd) when rem(h, 2) == 1 do
    rec(t, this_even+1, this_odd, c_odd+this_even+1)
  end
end

Solution.num_of_subarrays([1,3,5]) |> IO.inspect()
Solution.num_of_subarrays([2,4,6]) |> IO.inspect()
Solution.num_of_subarrays([1,2,3,4,5,6,7]) |> IO.inspect()

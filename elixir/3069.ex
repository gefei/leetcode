defmodule Solution do
  @spec result_array(nums :: [integer]) :: [integer]
  def result_array([a|[b|t]]) do
        rec(t, [a], [b], a, b)
  end

  def rec([], arr1, arr2, _, _), do: Enum.reverse(arr1) ++ Enum.reverse(arr2)

  def rec([h|t], arr1, arr2, last1, last2) do
    cond do
      last1 >= last2 -> rec(t, [h | arr1], arr2, h, last2)
      true           -> rec(t, arr1, [h | arr2], last1, h)
    end
  end
end

#Solution.result_array([2,1,3]) |> IO.inspect()
Solution.result_array([5,4,3,8]) |> IO.inspect()

defmodule Solution do
  @spec replace_elements(arr :: [integer]) :: [integer]
  def replace_elements(arr) do
    [h|t] = Enum.reverse(arr) |> rec(-1, [-1])
    t
  end

  def rec([], cur, acc) do
    acc
  end

  def rec([h|t], cur, acc) do
    if (h > cur) do
      rec(t, h, [h|acc])
    else
      rec(t, cur, [cur|acc] )
    end
  end
end


IO.inspect(Solution.replace_elements([17,18,5,4,6,1]))
IO.inspect(Solution.replace_elements([400]))

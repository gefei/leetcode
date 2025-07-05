defmodule Solution do
  @spec find_lucky(arr :: [integer]) :: integer
  def find_lucky(arr) do
    arr
      |> Enum.frequencies()
      |> Enum.filter(fn {a,b} -> a == b end)
      |> Enum.max_by(fn {a,_b} -> a end, fn -> {-1, -1} end)
      |> then(fn {a,_b} -> a end)
  end
end

Solution.find_lucky([2,2,3,4]) |> IO.inspect()
Solution.find_lucky([1,2,2,3,3,3]) |> IO.inspect()
Solution.find_lucky([2,2,2,3,3]) |> IO.inspect()

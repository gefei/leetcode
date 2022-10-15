defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    r = Enum.with_index(nums)
    x = r |> Enum.group_by(fn {n, idx} -> n end, fn {n, idx} -> idx end)
    [{a, b}|_] =
      r |> Enum.map( fn {a, i} -> other_idx(a, i, x, target) end)
        |> Enum.drop_while(fn {a, _} -> a == -1 end)
    [a, b]
  end

  def other_idx(n, i, m, target) do
    other = target - n
    x = Map.fetch(m, other)
    case x do
      {:ok, lst} ->
        case lst do
          [^i] -> {-1, -1}
          [h] -> {i, h}
          [h | [ht|_]] -> {h, ht}
        end
      :error -> {-1, -1}
    end
  end
end


x = Solution.two_sum([2,7,11,15], 9)
IO.inspect(x)
x = Solution.two_sum([3,2,4], 6)
IO.inspect(x)
x = Solution.two_sum([3,3], 6)
IO.inspect(x)

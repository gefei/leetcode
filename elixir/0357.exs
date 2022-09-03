defmodule Solution do
  def count_numbers_with_unique_digits(n) do
    cond do
      n == 0 -> 0
      n == 1 -> 10
      true ->
         factor = [9] ++ (2..n |> Enum.map(fn x -> 11 - x end))
         get_num(factor, 1, 0) + 1
    end
  end

  def get_num([], mult, acc) do
    acc 
  end

  def get_num([h|t], mult, acc) do
    get_num(t, h*mult, acc+h*mult)
  end
end

IO.inspect(Solution.count_numbers_with_unique_digits(0))
IO.inspect(Solution.count_numbers_with_unique_digits(2))
IO.inspect(Solution.count_numbers_with_unique_digits(3))
IO.inspect(Solution.count_numbers_with_unique_digits(4))

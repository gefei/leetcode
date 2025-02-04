defmodule Solution2376 do
  @spec count_special_numbers(n :: integer) :: integer
  def count_special_numbers(n) do
    s = Integer.to_string(n)
    cond do
       String.length(s) == 1 -> n
       String.length(s) == 2 ->
          i = String.at(s, 0) |> String.to_integer
          (i-1) * 9 + 10
    end
  end

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

IO.inspect(Solution2376.count_special_numbers(0))
IO.inspect(Solution2376.count_special_numbers(11))

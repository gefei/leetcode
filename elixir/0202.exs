defmodule Solution do
 @spec is_happy(n :: integer) :: boolean
  def is_happy(n) do
    ls = f([n])
    [h|t] = ls |> Enum.take_while(fn x -> not (has_one_dup(x)) end) |> Enum.at(-1)
    h === 1
  end
  def sum_sqr(n) do
    digits = 
      n |> Integer.to_string
        |> String.graphemes
        |> Enum.map(&(String.to_integer(&1)))
    digits |> Enum.map(&((&1)*(&1)))
           |> Enum.sum
  end 
  def f(x) do
     Stream.unfold(x, fn 
        [h|tail] -> {[sum_sqr(h)|[h|tail]], [sum_sqr(h)|[h|tail]]}
        end
     )
  end
  def has_one_dup(l) do
     Enum.count(Enum.uniq(l)) === Enum.count(l) - 2
  end
end

IO.inspect(Solution.is_happy(2))
IO.inspect(Solution.is_happy(19))

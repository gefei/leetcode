defmodule Solution do
  @spec kth_palindrome(queries :: [integer], int_length :: integer) :: [integer]
  def kth_palindrome(queries, int_length) do
    step(queries, int_length, [])
  end

  def step([], _len, acc), do: Enum.reverse(acc)
  def step([h|t], len, acc) do
    helf_len = div(len+1, 2)
    start = trunc(:math.pow(10, helf_len-1))
    cond do
      h <= start*9 -> step(t, len, [find_palin(h, len, start)|acc])
      true -> step(t, len, [-1|acc])
    end
  end

  def find_palin(n, 1, _start) do
    cond do
      n <= 9 -> n
      true -> -1
    end
  end

  def find_palin(n, len, start) do
    to_palin(start+n-1, len)
  end

  def to_palin(n, len) do
    list = Integer.to_charlist(n)
    cond do
      len - length(list) == length(list) ->
        (list ++ Enum.reverse(list)) |> List.to_integer()
      true ->
        (list ++ (tl Enum.reverse(list))) |> List.to_integer()
    end
  end
end

Solution.kth_palindrome([392015495,5,4,1,425320571,565971690,3,7,6,3,506222280,468075092,5], 2) |>  IO.inspect(charlists: :as_list)
#Solution.kth_palindrome([1,2,3,4,5,90], 3) |>  IO.inspect(charlists: :as_list)
#Solution.kth_palindrome([2,4,6], 4) |>  IO.inspect(charlists: :as_list)

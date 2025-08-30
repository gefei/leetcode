defmodule Solution do
  @spec monotone_increasing_digits(n :: integer) :: integer
  def monotone_increasing_digits(n) when n < 10, do: n
  def monotone_increasing_digits(n) do
      lst = n |> to_digit_list([])
      {a,b} = split((hd lst), (tl lst), &(&1<=&2), [])
      cond do
        length(b) == 0 -> n
        true ->
          l = Enum.reverse(a)
          {x,y} = split((hd l), (tl l), &(&1==&2),[])
          to_int(Enum.reverse(y) ++ [(hd x)-1 | to_nine(length(b)+length(x)-1, [])], 0)
      end
  end

  def to_int([], acc), do: acc
  def to_int([h|t], acc), do: to_int(t, acc*10+h)

  def to_nine(0, acc), do: acc
  def to_nine(n, acc), do: to_nine(n-1, [9 | acc])

  def split(a, [], _, left), do: {Enum.reverse([a|left]), []}
  def split(a, [h|t], f, left) do
    cond do
      f.(a, h) -> split(h, t, f, [a|left])
      true -> {Enum.reverse([a|left]), [h|t]}
    end
  end

  def to_digit_list(0, acc), do: acc
  def to_digit_list(n, acc), do: to_digit_list(div(n, 10), [rem(n, 10) | acc])
end

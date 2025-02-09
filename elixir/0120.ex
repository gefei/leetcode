defmodule Solution do
  @spec minimum_total(triangle :: [[integer]]) :: integer
  def minimum_total([h|t]) do
    rec(t, h) |> Enum.min()
  end

  def rec([], acc), do: acc
  def rec([h|t]=me, acc) do
    rec(t, one_row(h, acc))
  end

  def one_row([h1|t1]=me, [h2|t2]=over_me) do
    [h2+h1 | rec_one_row(t1, over_me, [])]
  end

  def rec_one_row([h], [h1], acc) do
    acc ++ [h+h1]
  end

  def rec_one_row([h|t], [h1|[h2|t1]], acc) do
    rec_one_row(t, [h2|t1], acc ++ [[h+h1, h+h2] |> Enum.min()])
  end
end

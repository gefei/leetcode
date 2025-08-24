defmodule Solution do
  use Bitwise

  @spec find_integers(n :: integer) :: integer
  def find_integers(n) do
      get_positions(n, 1, [])
      |> adjust_ones([])
      |> get_res(0)
  end

  def get_res([h], acc), do: 1 + fibo(h-1) + acc
  def get_res([a|t], acc) do
    get_res(t, fibo(a-1) + acc)
  end

  def adjust_ones([h], acc), do: [h|acc] |> Enum.reverse()
  def adjust_ones([a,b|t], acc) do
    cond do
      a == b+1 -> Enum.reverse(acc) ++ [a|Enum.to_list(a-2..1//-2)]
      true -> adjust_ones([b|t], [a|acc])
    end
  end

  def get_positions(0, _cur, acc), do: acc
  def get_positions(n, cur, acc) do
    cond do
      band(n, 1) == 1 -> get_positions(n >>> 1, cur+1, [cur | acc])
      true -> get_positions(n >>> 1, cur+1, acc)
    end
  end

  def fibo(n), do: fibo(n, 1, 1)
  defp fibo(0, _a, b), do: b
  defp fibo(n, a, b), do: fibo(n-1, b, a+b)
end

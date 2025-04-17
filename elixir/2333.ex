defmodule Solution do
  def min_sum_square_diff(nums1, nums2, k1, k2) do
    abs = nums1
          |> Enum.zip(nums2)
          |> Enum.map(fn {a,b} -> abs(a-b) end)
          |> Enum.sort(fn a,b -> a>b end)
    chunks = abs
             |> Enum.chunk_by(&(&1))
             |> Enum.map(fn [h|_] = c -> {h, length(c)} end)
    chunks |> rec(k1+k2)
  end
  def rec(a, 0) do
    a
    |> Enum.map(fn {n,l} -> l * n * n end)
    |> Enum.sum()
  end
  def rec([{0,_}], _) do
    0
  end
  def rec([{n,l}], k) do
    rec([{n,l}, {0,1}], k)
  end
  def rec([{n,l}|t], k) do
    [{a,b}|t2] = t
    cond do
      a == n -> rec([{n,l+b} | t2], k)
      true ->
        d = n - a
        cond do
          k >= d * l
               -> rec([{a, l+b} | t2], k-d*l)
          true -> q = div(k, l)
                  r = rem(k, l)
                  rec([{n-q, l-r} | [{n-q-1, r} | t]], 0)
        end
    end
  end
end

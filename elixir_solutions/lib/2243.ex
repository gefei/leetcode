defmodule Solution2243 do
  @spec digit_sum(s :: String.t, k :: integer) :: String.t
  def digit_sum(s, k) do
    cond do
      String.length(s) <= k -> s
      true ->
        x = divide_inner(s, [], k)
        y = x |> Enum.map(fn x -> ds(x) end)
        z = Enum.join(y)
        digit_sum(z, k)
    end
  end

  def ds(s) do
    s |> String.graphemes
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.sum
      |> Integer.to_string
  end

  def divide_inner(s, acc, k) do
     cond do
       String.length(s) <= k -> acc ++ [s]
       true ->
         {pre, sub} = String.split_at(s,k)
         divide_inner(sub, acc++[pre], k)
     end
  end
end

IO.inspect(Solution2243.digit_sum("00000000", 3))
IO.inspect(Solution2243.digit_sum("11111222223",3))

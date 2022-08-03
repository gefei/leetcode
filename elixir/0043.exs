defmodule Solution do
  @spec multiply(num1 :: String.t, num2 :: String.t) :: String.t
  def multiply(num1, num2) when num1 == "0" or num2 == "0" do
     "0"
  end

  def multiply(num1, num2) do
     n1 = String.reverse(num1) 
     n2 = String.reverse(num2) 
     n1_int = String.graphemes(n1) |> Stream.map(fn n -> String.to_integer(n) end)
     n2_int = String.graphemes(n2) |> Stream.map(fn n -> String.to_integer(n) end)
     res = times(n1_int, n2_int) |> post_process([])
     mapped = res |> Stream.map(fn n -> Integer.to_string(n) end)
     Enum.join(res, "")
  end

  def times(n1_int, n2_int) do
     d = n2_int |> Enum.count
     res = 0..d-1 |> Stream.map(fn c -> zeros(c) ++ time_one_digit(n1_int, (n2_int |> Enum.fetch!(c))) end) |> Enum.to_list
     max_length = res |> Stream.map(fn s -> Enum.count(s) end) |> Enum.max
     res_same_length = res |> Stream.map(fn s -> s ++ (Stream.cycle([0]) |> Enum.take(max_length - Enum.count(s))) end)
     Stream.zip_with(res_same_length, fn x -> Enum.sum(x) end) |> Enum.to_list
  end

  def zeros(c) do
     Stream.cycle([0]) |> Enum.take(c)
  end

  def time_one_digit(n1_int, n) do 
    n1_int |> Stream.map(fn x -> x * n end) |> Enum.to_list
  end

  def post_process([h], acc) do
     a = [h|acc]
     x = first(a)
  end

  def post_process([h|t], acc) do
     [p|q] = t
     h1 = rem(h, 10)
     h2 = div(h, 10)
     post_process([p+h2|q], [h1|acc])
  end

  def first([h|t]) when h < 10 do
     [h|t]
  end

  def first([h|t]) do
     h1 = div(h,10)
     h2 = rem(h,10)
     first([h1|[h2|t]])
  end

end

x = Solution.multiply("0", "5") 
IO.inspect x
x = Solution.multiply("3", "0")
IO.inspect x
x = Solution.multiply("32132940", "5") 
IO.inspect x
x = Solution.multiply("123", "125") 
IO.inspect x

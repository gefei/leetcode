defmodule Solution do
  @spec get_lucky(s :: String.t, k :: integer) :: integer
  def get_lucky(s, k) do
      x = convert(s)
      transform(x, 0, k)
  end
 
  def transform(x, k, k) do
      String.to_integer(x)
  end

  def transform(x, c, k) do
     a = String.graphemes(x)
       |> Enum.map(fn x -> String.to_integer(x) end)
       |> Enum.sum
     transform(Integer.to_string(a), c+1, k)
  end


  # https://elixirforum.com/t/get-ascii-value-of-a-character/16619
  def convert(s) do
     String.graphemes(s)
       |> Enum.map(fn x -> to_ascii(x) - ?a + 1 end)
       |> Enum.map(fn x -> Integer.to_string(x) end)
       |> Enum.join("")
  end

  def to_ascii(c) do
    <<v::utf8>> = c
    v
  end

end

IO.inspect(Solution.get_lucky("zbax", 2))
IO.inspect(Solution.get_lucky("iiii", 1))
IO.inspect(Solution.get_lucky("leetcode", 2))

defmodule Solution do
  @spec add_digits(num :: integer) :: integer
  def add_digits(num) when num >= 10 do
    x = num |> Integer.to_string()
            |> String.graphemes()
            |> Stream.map(&(String.to_integer(&1)))
            |> Enum.sum
    add_digits(x)
  end
  def add_digits(num) do
     num
  end
end

x = Solution.add_digits(38)
IO.inspect x
x = Solution.add_digits(0)
IO.inspect x
x = Solution.add_digits(492)
IO.inspect x

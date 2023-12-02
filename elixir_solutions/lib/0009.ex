defmodule Solution0009 do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    s = Integer.to_string(x)
    rev = String.reverse(s)
    s == rev
  end
end

x = Solution0009.is_palindrome(10)
IO.inspect x

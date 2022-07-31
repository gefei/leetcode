defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    s = Integer.to_string(x)
    rev = String.reverse(s)
    s == rev
  end
end

x = Solution.is_palindrome(10)
IO.inspect x

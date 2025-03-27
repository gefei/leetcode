defmodule Solution do
  @spec minimum_index(nums :: [integer]) :: integer
  def minimum_index([h|t] = nums) do
    {m, c} = domi(t, 1, h)
    len = length(nums)
    split(nums, m, Enum.count(nums, fn x -> x == m end), len, 0, 0, 0)
  end

  def domi([], c, m), do: {m, c}
  def domi([h|t], c, m) do
    cond do
      h == m -> domi(t, c+1, m)
      h != m && c > 0 -> domi(t, c-1, m)
      h != m && c == 0 -> domi(t, 1, h)
    end
  end

  def split([], m, c, len, left_len, left_domi, idx), do: -1
  def split([h|t], m, c, len, left_len, left_domi, idx) do
    right_len = len - left_len
    right_domi = c - left_domi
    cond do
      left_domi > div(left_len, 2) && right_domi > div(right_len, 2) -> idx - 1
      h == m -> split(t, m, c, len, left_len+1, left_domi+1, idx+1)
      true -> split(t, m, c, len, left_len+1, left_domi, idx+1)
    end
  end
end

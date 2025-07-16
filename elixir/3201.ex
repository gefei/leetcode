defmodule Solution do
  @spec maximum_length(nums :: [integer]) :: integer
  def maximum_length(nums = [h|t]) do
    step(nums, 0, 0, 1, h)
  end

  def step([], len_0, len_1, len_alt, _last_alt), do: Enum.max([len_0, len_1, len_alt])
  def step([h|t], len_0, len_1, len_alt, last_alt) do
    alt = rem(h, 2) != (rem(last_alt, 2))
    cond do
      rem(h,2) == 0 -> step(t,
                            len_0+1,
                            len_1,
                            if alt do len_alt+1 else len_alt end,
                            if alt do h else last_alt end)
      rem(h,2) == 1 -> step(t,
                            len_0,
                            len_1+1,
                            if alt do len_alt+1 else len_alt end,
                            if alt do h else last_alt end)
    end
  end
end

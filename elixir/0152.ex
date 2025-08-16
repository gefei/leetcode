defmodule Solution do
  @spec max_product(nums :: [integer]) :: integer
  def max_product([h|t]=nums) do
    pos = if h > 0 do h else 0 end
    neg = if h < 0 do h else 0 end
    step(t, pos, neg, h)
  end

  def step([], _pos, _neg, acc) do acc end
  def step([h|t], pos, neg, acc) do
    cond do
      h > 0 ->
        new_pos = Enum.max([h,pos*h])
        step(t, new_pos, neg*h, Enum.max([acc, new_pos]))
      h < 0 ->
        new_neg = Enum.min([h, pos*h])
        step(t, neg*h, new_neg, Enum.max([acc, neg*h]))
      true -> step(t, 0, 0, Enum.max([pos, acc]))
    end
  end
end

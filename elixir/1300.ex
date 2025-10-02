defmodule Solution do
  @spec find_best_value(arr :: [integer], target :: integer) :: integer
  def find_best_value(arr, target) do
    len = length(arr)
    case (split([], Enum.sort(arr), target, 0, len)) do
      {:==, left, right} -> hd right
      {:>, [], right} ->
        l_right = length(right)
        r_sum = l_right * (hd right)
        q = div(r_sum-target, l_right) + if rem(r_sum-target, l_right) == 0 do 0 else 1 end
        a = (hd right) - q
        cond do
          a < 0 -> 0
          true ->
            b = a + 1
            if target - a * l_right <= b * l_right - target do a else b end
        end
      {:>, left, right} ->
        l_right = length(right)
        l_sum = Enum.sum(left)
        r_sum = l_right * (hd right)
        sum = l_sum + r_sum
        q = div(sum-target, l_right) + if rem(sum-target, l_right) == 0 do 0 else 1 end
        a = (hd right) - q
        cond do
          a < hd left -> hd left
          true -> b = a + 1
            if target - l_sum - a * l_right <= l_sum + b * l_right - target do a else b end
        end
      {:<, left, []} ->
        hd left
    end
  end

  def split(left, [], _target, _last_num, _rest_len) do
    {:<, left, []}
  end
  def split(left, right=[h|t], target, last_num, rest_len) do
    x = last_num + (rest_len) * h
    cond do
      x >  target -> {:>,  left, right}
      x == target -> {:==, left, right}
      true -> split([h|left], (tl right), target, last_num+h, rest_len-1)
    end
  end
end

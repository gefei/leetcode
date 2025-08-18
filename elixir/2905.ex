defmodule Solution do
  @spec find_indices(nums :: [integer], index_difference :: integer, value_difference :: integer) :: [integer]
  def find_indices([h], index_difference, value_difference) do
    if index_difference == 0 && value_difference == 0 do
      [0,0]
    else
      [-1, -1]
    end
  end
  def find_indices(nums, index_difference, value_difference) do
    len = length(nums)
    [h|t] = Enum.reverse(nums)
    mn = min_from_right(t, len-2, [{len-1, {h, len-1}}]) |> Map.new()
    mx = max_from_right(t, len-2, [{len-1, {h, len-1}}]) |> Map.new()
    case find(nums, mn, 0, index_difference, value_difference, length(nums)) do
      [-1, -1] -> find(nums, mx, 0, index_difference, value_difference, length(nums))
      a -> a
    end
  end

  def find([], _mn, _cur_idx, _i_d, _v_d, _len), do: [-1, -1]
  def find([h|t], mn, cur_idx, i_d, v_d, len) do
    cond do
      cur_idx + i_d >= len -> [-1, -1]
      true ->
        mn |> IO.inspect()
        {x, idx} = Map.get(mn, cur_idx+i_d)
        diff = h-x
        {mn, x, idx, diff}|> IO.inspect()
        d = if diff > 0 do diff else -diff end
        cond do
          -v_d >= -d || v_d <= d -> [cur_idx, idx]
          true -> find(t, mn, cur_idx+1, i_d, v_d, len)
        end
    end
  end

  def min_from_right([], _my_idx, acc), do: acc
  def min_from_right([h|t], my_idx, acc) do
    {_, {v_acc, idx_acc}} = hd acc
    cond do
      h < v_acc-> min_from_right(t, my_idx-1, [{my_idx, {h,my_idx}}|acc])
      true -> min_from_right(t, my_idx-1, [{my_idx, {v_acc, idx_acc}}|acc])
    end
  end

  def max_from_right([], _my_idx, acc), do: acc
  def max_from_right([h|t], my_idx, acc) do
    {_, {v_acc, idx_acc}} = hd acc
    cond do
      h > v_acc-> max_from_right(t, my_idx-1, [{my_idx, {h,my_idx}}|acc])
      true -> max_from_right(t, my_idx-1, [{my_idx, {v_acc, idx_acc}}|acc])
    end
  end
end

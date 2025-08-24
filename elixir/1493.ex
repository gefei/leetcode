defmodule Solution do
  @spec longest_subarray(nums :: [integer]) :: integer
  def longest_subarray(nums) do
    x = get_one_positions(nums, 0, 0, 0, 0, [])
    case length(x) do
      0 -> 0
      1 -> {a,b} = hd x
           if b-a == length(nums) do b-a-1 else b-a end
      _ ->
        y = Enum.reverse(x)
        {a, b} = hd y
        do_find(y, b-a)
    end
  end

  def do_find([_], acc), do: acc
  def do_find([{a1,b1},{a2,b2}|t], acc) do
    {a1, b1, a2, b2, acc}
    new_acc = cond do
      a2 - b1 == 1 -> if b2-a1-1 > acc do b2-a1-1 else acc end
      a2 - b1 > 1 -> if b2-a2 > acc do b2-a2 else acc end
    end
    do_find([{a2,b2} | t], new_acc)
  end

  def get_one_positions([], state, pos, start, _nd, acc) do
    cond do
      state == 0 -> acc
      true -> [{start, pos} | acc]
    end
  end
  def get_one_positions([h|t], state, pos, start, nd, acc) do
    cond do
      state == 0 ->
        if h == 1 do
          get_one_positions(t, 1, pos+1, pos, nd, acc)
        else
          get_one_positions(t, 0, pos+1, pos, nd, acc)
        end
      true ->
        if h == 1 do
          get_one_positions(t, 1, pos+1, start, nd, acc)
        else
          get_one_positions(t, 0, pos+1, start, pos, [{start, pos} | acc])
        end
    end
  end
end

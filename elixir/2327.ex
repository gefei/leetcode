defmodule Solution do
  def people_aware_of_secret(n, delay, forget) do
    rem((hd step(n, delay, forget, 0, [1])), 1_000_000_007)
  end

  def step(0, _delay, _forget, _pos, acc), do: acc
  def step(n, delay, forget, pos, acc) do
    cond do
      pos < delay ->
        step(n-1, delay, forget, pos+1, [(hd acc)|acc])
      pos >= delay && pos < forget ->
        step(n-1, delay, forget, pos+1, [(hd acc) + Enum.at(acc, delay-1)| acc])
      true ->
        {left, right} = Enum.split(acc, forget-1)
        forgotten = Enum.at(acc, forget-1)
        left_update = Enum.map(left, &(&1-forgotten))
        acc_update = left_update
        new_num = hd(acc_update) + Enum.at(acc_update, delay-1)
        step(n-1, delay, forget, pos+1, [new_num|acc_update])
    end
  end
end

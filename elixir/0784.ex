defmodule Solution do
  @spec letter_case_permutation(s :: String.t) :: [String.t]
  def letter_case_permutation(s) do
    lst = String.to_charlist(s)
    step(lst, [[]]) |> Enum.map(&(List.to_string(&1 |> Enum.reverse())))
  end

  def step([], acc), do: acc
  def step([h|t], acc) do
    cond do
      ?0 <= h && h <= ?9 ->
        new_acc = Enum.map(acc, &([h|&1]))
        step(t, new_acc)
      ?a <= h && h <= ?z ->
        new_acc = Enum.map(acc, &([h|&1])) ++ Enum.map(acc, &([h-32|&1]))
        step(t, new_acc)
      ?A <= h && h <= ?Z ->
        new_acc = Enum.map(acc, &([h|&1])) ++ Enum.map(acc, &([h+32|&1]))
        step(t, new_acc)
    end
  end
end

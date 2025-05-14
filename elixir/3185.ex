defmodule Solution do
  @spec count_complete_day_pairs(hours :: [integer]) :: integer
  def count_complete_day_pairs(hours) do
    freq = Enum.frequencies_by(hours, &(rem(&1, 24)))
    Enum.reduce(freq, 0, fn {k, v}, acc ->
      cond do
        k == 0 or k == 12 ->
          acc + div(v * (v - 1), 2)
        k < 12 -> acc + (Map.get(freq, 24 - k, 0) * v)
        true -> acc
      end
    end)
  end
end

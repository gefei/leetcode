defmodule Solution do
  @spec num_pairs_divisible_by60(time :: [integer]) :: integer
  def num_pairs_divisible_by60(time) do
    freq = Enum.frequencies_by(time, &(rem(&1, 60)))
    Enum.reduce(freq, 0, fn {k, v}, acc ->
      cond do
        k == 0 or k == 30 ->
          acc + div(v * (v - 1), 2)
        k < 30 -> acc + (Map.get(freq, 60 - k, 0) * v)
        true -> acc
      end
    end)
  end
end

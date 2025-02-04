defmodule Solution do
  @spec compressed_string(word :: String.t) :: String.t
  def compressed_string(word) do
    word
    |> :binary.bin_to_list()
    |> Enum.chunk_by(&(&1))
    |> Enum.map(fn x -> List.to_string(x) end)
    |> Enum.map(fn x -> add_streak(x) end)
    |> Enum.join()
  end

  def add_streak(chars) do
    n = String.length(chars)
    c = String.at(chars, 0)
    q = div(n, 9)
    r = rem(n, 9)
    q_s = String.duplicate("9#{c}", q)
    cond do
       r == 0 -> q_s
       r > 0 -> q_s <> Integer.to_string(r) <> c
    end
  end
end

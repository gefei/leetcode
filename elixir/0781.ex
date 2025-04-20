defmodule Solution do
  @spec num_rabbits(answers :: [integer]) :: integer
  def num_rabbits(answers) do
    answers
      |> Enum.sort()
      |> Enum.chunk_by(&(&1))
      |> Enum.map(fn a -> {Enum.at(a, 0), length(a)} end) |> IO.inspect()
      |> Enum.map(fn x -> num_needed(x) end)
      |> Enum.sum()
  end

  def num_needed({answer,num}) do
    sz = answer + 1
    groups = if (rem(num, sz) == 0) do div(num, sz) else div(num, sz) + 1 end
    sz * groups
  end
end

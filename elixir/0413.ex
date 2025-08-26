defmodule Solution do
  @spec number_of_arithmetic_slices(nums :: [integer]) :: integer
  def number_of_arithmetic_slices(nums) do
    cond do
      length(nums) < 3 -> 0
      true -> step(nums, 0, 0)
    end
  end

  def step([a,b,c], cur_stroke_len, acc) do
    {[a,b,c], :cur, cur_stroke_len, :acc, acc} |> IO.inspect()
    #c = z
    cond do
      b+b == c+a -> acc + div((cur_stroke_len+1)*(cur_stroke_len+2), 2)
      true -> acc + div(cur_stroke_len*(cur_stroke_len+1), 2)
    end
  end
  def step([a,b,c|t], cur_stroke_len, acc) do
    {[a,b,c|t], :cur, cur_stroke_len, :acc, acc} |> IO.inspect()
    cond do
      b+b == c+a -> step([b,c|t], cur_stroke_len+1, acc)
      true -> step([b,c|t], 0, acc+div(cur_stroke_len*(cur_stroke_len+1), 2))
    end
  end
end

defmodule Solution do
  @spec largest_perimeter(nums :: [integer]) :: integer
  def largest_perimeter(nums) do
    step(Enum.sort(nums), 0)
  end

  def step([_b,_c], acc), do: acc
  def step([a,b,c|t], acc) do
    cond do
      c < a+b && a+b+c > acc -> step([b,c|t], a+b+c)
      true -> step([b,c|t], acc)
    end
  end
end

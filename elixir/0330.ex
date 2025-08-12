defmodule Solution do
  @spec min_patches(nums :: [integer], n :: integer) :: integer
  def min_patches(nums, n) do
    min_patches(nums, n, 0, [])
  end

  def min_patches(_nums, n, cur, acc) when cur >= n, do: acc
  def min_patches([], n, cur, acc) do
      min_patches([], n, cur+cur+1, [cur+1|acc])
  end
  def min_patches([h|t]=nums, n, cur, acc) do
    cond do
      h <= cur+1 -> min_patches(t, n, cur+h, acc)
      true -> min_patches(nums, n, cur+cur+1, [cur+1|acc])
    end
  end
end

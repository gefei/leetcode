defmodule Solution do
  def find_content_children(g, s) do
    gd = g |> Enum.sort()
    sz = s |> Enum.sort()
    count(gd, sz, 0)
  end

  def count([], _, acc), do: acc
  def count(_, [], acc), do: acc
  def count(gd=[h_gd|t_gd], [h_sz|t_sz], acc) do
    cond do
      h_sz >= h_gd -> count(t_gd, t_sz, acc+1)
      true -> count(gd, t_sz, acc)
    end
  end
end

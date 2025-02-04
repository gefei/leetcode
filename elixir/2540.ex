defmodule Solution do
  @spec get_common(nums1 :: [integer], nums2 :: [integer]) :: integer
  def get_common([], _) do
    -1
  end
  def get_common(_, []) do
    -1
  end
  def get_common([h1|t1], [h2|t2]) do
    cond do
      h1 == h2 -> h1
      h1 < h2 -> get_common(t1, [h2|t2])
      h1 > h2 -> get_common([h1|t1], t2)
    end
  end
end

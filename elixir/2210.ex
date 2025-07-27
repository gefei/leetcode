defmodule Solution do
  @spec count_hill_valley(nums :: [integer]) :: integer
  def count_hill_valley(nums) do
    step((hd nums), (tl nums), false, false, 0, 0)
  end

  def step(cur, [], _is_asc, _is_dsc, num_hill, num_valley) do
    num_hill + num_valley
  end
  def step(cur, [h|t], is_asc, is_dsc, num_hill, num_valley) do
    cond do
      h == cur -> step(cur, t, is_asc, is_dsc, num_hill, num_valley)
      h > cur -> cond do
        is_asc -> step(h, t, true, false, num_hill, num_valley)
        is_dsc ->
          step(h, t, true, false, num_hill, num_valley+1)
        true -> step(h, t, true, false, num_hill, num_valley)
      end
      h < cur -> cond do
        is_asc ->
          step(h, t, false, true, num_hill+1, num_valley)
        is_dsc -> step(h, t, false, true, num_hill, num_valley)
        true -> step(h, t, false, true, num_hill, num_valley)
      end
    end
  end
end

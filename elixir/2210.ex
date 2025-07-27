defmodule Solution do
  @spec count_hill_valley(nums :: [integer]) :: integer
  def count_hill_valley(nums) do
    step((hd nums), (tl nums), false, false, 0, 0)
  end

  def step(cur, [], _is_asc, _is_dsc, num_hill, num_valey) do
    num_hill + num_valey
  end
  def step(cur, [h|t], is_asc, is_dsc, num_hill, num_valey) do
    {:cur, cur, :h, h, :asc,is_asc, :dsc, is_dsc, :h, num_hill, :v, num_valey} |> IO.inspect()
    cond do
      h == cur -> step(cur, t, is_asc, is_dsc, num_hill, num_valey)
      h > cur -> cond do
        is_asc -> step(h, t, true, false, num_hill, num_valey)
        is_dsc ->
          step(h, t, true, false, num_hill, num_valey+1)
        true -> step(h, t, true, false, num_hill, num_valey)
      end
      h < cur -> cond do
        is_asc ->
          step(h, t, false, true, num_hill+1, num_valey)
        is_dsc -> step(h, t, false, true, num_hill, num_valey)
        true -> step(h, t, false, true, num_hill, num_valey)
      end
    end
  end
end

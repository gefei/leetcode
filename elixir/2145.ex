defmodule Solution do
  @spec number_of_arrays(differences :: [integer], lower :: integer, upper :: integer) :: integer
  def number_of_arrays(differences, lower, upper) do
    diffs_to_a = [0 | Enum.scan(differences, &(&1+&2))]
    needed = Enum.max(diffs_to_a) - Enum.min(diffs_to_a)
    Enum.max([upper-lower - needed + 1, 0])
  end
end

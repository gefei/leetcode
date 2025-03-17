defmodule Solution do
  @spec check_powers_of_three(n :: integer) :: boolean
  def check_powers_of_three(n) do
    not (Integer.to_string(n, 3)
          |> String.to_charlist()
          |> Enum.any?(&(&1 !== ?1 && &1 !== ?0)))
  end
end

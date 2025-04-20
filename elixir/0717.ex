defmodule Solution do
  @spec is_one_bit_character(bits :: [integer]) :: boolean
  def is_one_bit_character([]), do: false
  def is_one_bit_character([0]), do: true

  def is_one_bit_character([a|[b|t]]) do
    cond do
      a == 1 -> is_one_bit_character(t)
      a == 0 -> is_one_bit_character([b|t])
    end
  end
end

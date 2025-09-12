defmodule Solution do
  @spec does_alice_win(s :: String.t) :: boolean
  def does_alice_win(s) do
    num_vowel =
      s |> String.to_charlist()
        |> Enum.count(fn c -> Enum.member?([?a, ?e, ?i, ?o, ?u], c) end)
    num_vowel != 0
  end
end

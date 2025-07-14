defmodule ListNode do
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec get_decimal_value(head :: ListNode.t | nil) :: integer
  def get_decimal_value(head) do
    step(head, 0)
  end

  def step(nil, acc), do: acc
  def step(%ListNode{val: v, next: n}, acc), do: step(n, acc*2+v)
end

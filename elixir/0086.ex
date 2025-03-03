defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec partition(head :: ListNode.t | nil, x :: integer) :: ListNode.t | nil
  def partition(head, x) do
    rec(head, x, nil, nil)
  end

  def rec(nil, _x, l, g), do: rev(l, rev(g, nil))

  def rec(%ListNode{val: v, next: n}, x, l, g) do
    cond do
      v < x -> rec(n, x, %ListNode{val: v, next: l}, g)
      true -> rec(n, x, l, %ListNode{val: v, next: g})
    end
  end

  def rev(nil, acc), do: acc
  def rev(%ListNode{val: v, next: n}, acc) do
    rev(n, %ListNode{val: v, next: acc})
  end
end

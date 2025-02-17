defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec sum_numbers(root :: TreeNode.t | nil) :: integer
  def sum_numbers(root) do
    rec(root, 0, []) |> Enum.sum()
  end

  def rec(%TreeNode{val: v, left: nil, right: nil}, path, acc) do
    acc ++ [path*10+v]
  end
  def rec(%TreeNode{val: v, left: nil, right: r}, path, acc) do
    rec(r, path*10+v, acc)
  end
  def rec(%TreeNode{val: v, left: l, right: nil}, path, acc) do
    rec(l, path*10+v, acc)
  end
  def rec(%TreeNode{val: v, left: l, right: r}, path, acc) do
    rec(r, path*10+v, rec(l, path*10+v, acc))
  end
end

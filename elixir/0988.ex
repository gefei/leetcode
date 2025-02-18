defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec smallest_from_leaf(root :: TreeNode.t | nil) :: String.t
  def smallest_from_leaf(root) do
    rec(root, "", []) |> Enum.min()
  end

  def num_to_str(v) do
    List.to_string([v+97])
  end

  def rec(%TreeNode{val: v, left: nil, right: nil}, path, acc) do
    acc ++ [num_to_str(v) <> path]
  end
  def rec(%TreeNode{val: v, left: nil, right: r}, path, acc) do
    rec(r, num_to_str(v) <> path, acc)
  end
  def rec(%TreeNode{val: v, left: l, right: nil}, path, acc) do
    rec(l, num_to_str(v) <> path, acc)
  end
  def rec(%TreeNode{val: v, left: l, right: r}, path, acc) do
    rec(r, num_to_str(v) <> path, rec(l, num_to_str(v) <> path, acc))
  end
end

defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil

  def init(v, l, r) do
    %TreeNode{val: v, left: l, right: r}
  end
end

defmodule Solution do
  @spec binary_tree_paths(root :: TreeNode.t | nil) :: [String.t]
  def binary_tree_paths(root) do
    rec(root, [], [])
    |> Enum.map(fn x -> Enum.join(x, "->") end)
  end

  def rec(%TreeNode{val: v, left: nil, right: nil}, path, acc) do
    acc ++ [path ++ [v]]
  end

  def rec(%TreeNode{val: v, left: l, right: nil}, path, acc) do
    rec(l, path ++ [v], acc)
  end

  def rec(%TreeNode{val: v, left: nil, right: r}, path, acc) do
    rec(r, path ++ [v], acc)
  end

  def rec(%TreeNode{val: v, left: l, right: r}, path, acc) do
    rec(l, path++[v], rec(r, path ++ [v], acc))
  end
end

#root = TreeNode.init(
#  1,
#  TreeNode.init(
#    2,
#    nil,
#    TreeNode.init(5, nil, nil)
#  ),
#  TreeNode.init(3, nil, nil)
#)
#IO.inspect(Solution.binary_tree_paths(root))

root = TreeNode.init(
  1,
  TreeNode.init(
    2,
    TreeNode.init(5, nil, nil),
    TreeNode.init(6, nil, nil)
  ),
  TreeNode.init(3, nil, nil)
)
IO.inspect(Solution.binary_tree_paths(root))

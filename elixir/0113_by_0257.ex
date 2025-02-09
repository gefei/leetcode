defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
  def init(val, left, right) do
    %TreeNode{val: val, left: left, right: right}
  end
end

defmodule Solution do
  @spec path_sum(root :: TreeNode.t | nil, target_sum :: integer) :: [[integer]]
  def path_sum(nil, target_sum) do
    []
  end

  def path_sum(root, target_sum) do
    rec(root, [], [])
    |> Enum.filter(fn x -> Enum.sum(x) == target_sum end)
  end

  def rec(%TreeNode{val: v, left: nil, right: nil}, path, acc) do
    acc ++ [path ++ [v]]
  end

  def rec(%TreeNode{val: v, left: nil, right: r}, path, acc) do
    rec(r, path++[v], acc)
  end

  def rec(%TreeNode{val: v, left: l, right: nil}, path, acc) do
    rec(l, path++[v], acc)
  end

  def rec(%TreeNode{val: v, left: l, right: r}, path, acc) do
    rec(r, path++[v], rec(l, path++[v], acc))
  end
end

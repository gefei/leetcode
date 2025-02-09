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
    rec(root, target_sum, 0, [], [])
  end

  def rec(%TreeNode{val: v, left: nil, right: nil}, target_sum, sum, path, acc) do
    cond do
      sum+v == target_sum -> acc ++ [path ++ [v]]
      true -> acc
    end
  end

  def rec(%TreeNode{val: v, left: nil, right: r}, target_sum, sum, path, acc) do
    rec(r, target_sum, v+sum, path++[v], acc)
  end

  def rec(%TreeNode{val: v, left: l, right: nil}, target_sum, sum, path, acc) do
    rec(l, target_sum, v+sum, path++[v], acc)
  end

  def rec(%TreeNode{val: v, left: l, right: r}, target_sum, sum, path, acc) do
    rec(r, target_sum, v+sum, path++[v], rec(l, target_sum, v+sum, path++[v], acc))
  end
end

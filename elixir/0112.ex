defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec has_path_sum(root :: TreeNode.t | nil, target_sum :: integer) :: boolean
 def has_path_sum(root, target_sum) do
   rec(root, target_sum, 0)
 end

 def rec(nil, _, _), do: false

 def rec(%TreeNode{val: v, left: nil, right: nil}, target_sum, acc) do
   v+acc == target_sum
 end

 def rec(%TreeNode{val: v, left: nil, right: r}, target_sum, acc) do
   rec(r, target_sum, acc+v)
 end

 def rec(%TreeNode{val: v, left: l, right: nil}, target_sum, acc) do
   rec(l, target_sum, acc+v)
 end

 def rec(%TreeNode{val: v, left: l, right: r}, target_sum, acc) do
   rec(l, target_sum, acc+v) || rec(r, target_sum, acc+v)
 end
end

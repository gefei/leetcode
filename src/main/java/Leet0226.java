public class Leet0226 {
    public TreeNode invertTree(TreeNode root) {
        if (root == null) {return null;}
        TreeNode left = invertTree(root.left);
        TreeNode right = invertTree(root.right);
        return new TreeNode(root.val, right, left);
    }
}

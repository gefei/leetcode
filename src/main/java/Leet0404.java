public class Leet0404 {
    public int sumOfLeftLeaves(TreeNode root) {
        return toRight(root);
    }

    public int toRight(TreeNode right) {
        if (right == null) {return 0;}
        return toLeft(right.left) + toRight(right.right);
    }

    public int toLeft(TreeNode left) {
        if (left == null) {return 0;}
        if (left.left == null && left.right == null) {return left.val;}
        return toLeft(left.left) + toRight(left.right);
    }
}

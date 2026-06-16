import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode() {}
    TreeNode(int val) { this.val = val; }
    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

public class Leet0102 {
    public List<List<Integer>> levelOrder(TreeNode root) {
        if (root == null) return new LinkedList<>();
        Queue<TreeNode> qTree = new LinkedList<>();
        Queue<Integer> qDepth = new LinkedList<>();
        qTree.add(root);
        int curDepth = -1;
        List<List<Integer>> res = new LinkedList<>();
        qDepth.add(0);
        List<Integer> curList = null;
        while (!qTree.isEmpty()) {
            TreeNode cur = qTree.remove();
            int treeDepth = qDepth.remove();
            System.out.println(treeDepth + ": " + cur.val);
            if (curDepth < treeDepth) {
                curDepth = treeDepth;
                curList = new LinkedList<>();
                res.add(curList);
            }
            curList.add(cur.val);
            if (cur.left != null) {
                qTree.add(cur.left);
                qDepth.add(treeDepth + 1);
            }
            if (cur.right != null) {
                qTree.add(cur.right);
                qDepth.add(treeDepth + 1);
            }
        }
        return res;
    }
    public static void main(String[] args) {
        Leet0102 leet0102 = new Leet0102();
        TreeNode root = new TreeNode(1);
        //root.left = new TreeNode(2);
        root.right = new TreeNode(3);
        System.out.println(leet0102.levelOrder(root));
    }
}

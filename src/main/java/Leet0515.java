import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class Leet0515 {
    public List<Integer> largestValues(TreeNode root) {
        List<Integer> res = new LinkedList<>();
        LinkedList<TreeNode>  queue = new LinkedList<>();
        Queue<Integer> depth = new LinkedList<>();
        queue.add(root);
        depth.add(0);
        int rowMax = Integer.MIN_VALUE;
        int row = -1;
        while (!queue.isEmpty()) {
            TreeNode node = queue.remove();
            int d = depth.remove();
            if (d > row) {
                row = d;
                res.add(rowMax);
                rowMax = Integer.MIN_VALUE;
            }
            if (node.val > rowMax) {
                rowMax = node.val;
            }
            if (node.left != null) {
                queue.add(node.left);
                depth.add(row+1);
            }
            if (node.right != null) {
                queue.add(node.right);
                depth.add(row+1);
            }
        }
        res.add(rowMax);
        res.remove(0);
        return res;
    }

    public static void main(String[] args) {
        Leet0515 leet0515 = new Leet0515();
        TreeNode root = new TreeNode(
                1,
                new TreeNode(2),
                new TreeNode(3)
        );
        System.out.println(leet0515.largestValues(root));
    }
}

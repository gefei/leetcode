import java.util.HashMap;
import java.util.HashSet;

public class Leet2196 {
    public TreeNode createBinaryTree(int[][] descriptions) {
        HashSet<Integer> nodes = new HashSet<>();
        HashSet<Integer> children = new HashSet<>();
        HashMap<Integer, TreeNode> map = new HashMap<>();
        for (int i = 0; i < descriptions.length; i++) {
            int[] row = descriptions[i];
            TreeNode root = map.getOrDefault(row[0], new TreeNode(row[0]));
            TreeNode child = map.getOrDefault(row[1], new TreeNode(row[1]));
            map.put(row[0], root);
            map.put(row[1], child);
            if (row[2] == 1) {
                root.left = child;
            } else  {
                root.right = child;
            }
            nodes.add(row[0]);
            children.add(row[1]);
        }
        nodes.removeAll(children);
        return map.get(nodes.iterator().next());
    }
}

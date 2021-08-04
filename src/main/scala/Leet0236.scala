import java.util

class Leet0236 {
  def lowestCommonAncestor(root: TreeNode, p: TreeNode, q: TreeNode): TreeNode = {

    var history = new java.util.LinkedList[TreeNode]
    def dfs(root: TreeNode, p: TreeNode): (Boolean, java.util.LinkedList[TreeNode]) = {
      history.add(root)
      if (root == p) return (true, history)
      if (root.left != null && dfs(root.left, p)._1) return (true, history)
      if (root.right != null && dfs(root.right, p)._1) return (true, history)
      history.remove(history.size-1)
      (false, null)
    }
    val hp = dfs(root, p)._2
    history = new java.util.LinkedList[TreeNode]()
    val hq = dfs(root, q)._2
    history = new java.util.LinkedList[TreeNode]()

    var i = 0
    var finished = false
    while (i < hp.size() && i < hq.size() && !finished) {
      val cp = hp.get(i)
      val cq = hq.get(i)
      if (cp.value != cq.value) {
        i -= 1
        finished = true
      }
      i += 1
    }
    hp.get(i-1)
  }
}

object Leet0236 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0236
    val zero = new TreeNode(0, null, null)
    val three = new TreeNode(3, null, null)
    val five = new TreeNode(5, null, null)
    val seven = new TreeNode(7, null, null)
    val nine = new TreeNode(9, null, null)
    val four = new TreeNode(4, three, five)
    val two = new TreeNode(2, zero, four)
    val eight = new TreeNode(8, seven, nine)
    val six = new TreeNode(6, two, eight)
    println(leet.lowestCommonAncestor(six, two, eight).value)
    println(leet.lowestCommonAncestor(six, two, four).value)
    println(leet.lowestCommonAncestor(six, three, two).value)
    println(leet.lowestCommonAncestor(six, eight, seven).value)
    println(leet.lowestCommonAncestor(six, nine, seven).value)
    println(leet.lowestCommonAncestor(six, seven, nine).value)
  }
}

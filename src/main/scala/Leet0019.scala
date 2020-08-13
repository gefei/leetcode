// https://leetcode.com/problems/container-with-most-water/

class Leet0019 {
  def removeNthFromEnd(head: ListNode, n: Int): ListNode = {
    val stack = new scala.collection.mutable.Stack[ListNode]()
    var h = head
    while (h != null) {
      stack.push(h)
      h = h.next
    }
    var i = 0
    var next_node = h
    while (i != n) {
      val node = stack.pop()
      next_node = node.next
      i += 1
    }
    if (stack.isEmpty) {
      return head.next
    }
    val x = stack.pop()
    x.next = next_node
    head
  }
}

object Leet0019 {
  def main(args: Array[String]): Unit = {
    val node5 = new ListNode(5)
    val node4 = new ListNode(4, node5)
    val node3 = new ListNode(3, node4)
    val node2 = new ListNode(2, node3)
    val node1 = new ListNode(1, node2)

    val leet = new Leet0019()
    leet.removeNthFromEnd(node1, 4)
  }
}




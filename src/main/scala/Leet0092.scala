import scala.collection.mutable

object Leet0092 {
  def reverseBetween(head: ListNode, left: Int, right: Int): ListNode = {
    val zero = new ListNode(_next = head)
    var prev = zero
    var next = zero.next
    var i = 1
    while (i < left) {
      prev = prev.next
      next = next.next
      i = i + 1
    }
    val s: mutable.Stack[Int] = new mutable.Stack[Int]()
    while (i <= right) {
      s.push(next.x)
      next = next.next
      i = i + 1
    }
    while (s.nonEmpty) {
      val node = new ListNode(s.pop())
      prev.next = node
      prev = prev.next
    }
    prev.next = next
    zero.next
  }

  def main(args: Array[String]): Unit = {
    val five = new ListNode(5)
    val four = new ListNode(4, five)
    val three = new ListNode(3, four)
    val two = new ListNode(2, three)
    val one = new ListNode(1, two)
    printList(one)
    var x = reverseBetween(one, 2, 4)
    printList(x)
    x = reverseBetween(five, 1, 1)
    printList(x)
  }

  def printList(head: ListNode): Unit = {
    var cursor = head
    while (cursor != null) {
      print(cursor.x + " ")
      cursor = cursor.next
    }

    println()
  }
}


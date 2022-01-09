import scala.collection.mutable

object Leet0445 {
  def addTwoNumbers(l1: ListNode, l2: ListNode): ListNode = {
    val s1:  mutable.Stack[Int] = new mutable.Stack[Int]()
    val s2:  mutable.Stack[Int] = new mutable.Stack[Int]()
    val res: mutable.Stack[Int] = new mutable.Stack[Int]()

    var n = l1
    while (n != null) {
      s1.push(n.x)
      n = n.next
    }
    n = l2
    while (n != null) {
      s2.push(n.x)
      n = n.next
    }
    var c = 0
    while (s1.nonEmpty && s2.nonEmpty) {
      var sum = s1.pop() + s2.pop() + c
      c = sum / 10
      sum = sum % 10
      res.push(sum)
    }
    while (s1.nonEmpty) {
      var sum = s1.pop() + c
      c = sum / 10
      sum = sum % 10
      res.push(sum)
    }
    while (s2.nonEmpty) {
      var sum = s2.pop() + c
      c = sum / 10
      sum = sum % 10
      res.push(sum)
    }
    if (c == 1) {
      res.push(1)
    }
    n = new ListNode()
    val head = n
    while (res.nonEmpty) {
      n.next = new ListNode(res.pop())
      n = n.next
    }
    head.next
  }
  def main(args: Array[String]): Unit = {
    val n1 = new ListNode(3)
    val n2 = new ListNode(4,n1)
    val n3 = new ListNode(2,n2)
    val n4 = new ListNode(7,n3)

    val n5 = new ListNode(4)
    val n6 = new ListNode(6, n5)
    val n7 = new ListNode(5, n6)

    println(addTwoNumbers(n4, n7))
  }
}


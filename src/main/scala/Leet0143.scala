import scala.collection.mutable

object Leet0143 {
  def reorderList(head: ListNode): Unit = {
    val s: mutable.Stack[Int] = new mutable.Stack[Int]()
    var c = 0
    var cursor = head
    while (cursor != null) {
      s.push(cursor.x)
      c = c + 1
      cursor = cursor.next
    }
    var n = 0
    if (head.next == null) return

    var newHead = new ListNode(head.x)
    var me = newHead
    cursor = head.next
    while (n < c / 2 - 1) {
      n = n + 1
      var newNode = new ListNode(s.pop())
      me.next = newNode
      me = me.next
      newNode = new ListNode(cursor.x)
      me.next = newNode
      me = me.next
      cursor = cursor.next
    }
    val newNode = new ListNode(s.pop())
    me.next = newNode
    me = me.next
    if (c % 2 != 0) {
      val newNode = new ListNode(cursor.x)
      me.next = newNode
    }
    head.next = newHead.next
  }

  def main(args: Array[String]): Unit = {
    var five = new ListNode(5)
    var four = new ListNode(4, five)
    var three = new ListNode(3, four)
    var two = new ListNode(2, three)
    var one = new ListNode(1, two)
    printList(one)
    reorderList(one)
    printList(one)

    five = new ListNode(5)
    four = new ListNode(4, five)
    printList(four)
    reorderList(four)
    printList(four)

    five = new ListNode(5)
    printList(five)
    reorderList(five)
    printList(five)

    five = new ListNode(5)
    four = new ListNode(4, five)
    three = new ListNode(3, four)
    printList(three)
    reorderList(three)
    printList(three)
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


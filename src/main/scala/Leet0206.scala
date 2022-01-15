object Leet0206 {
  def reverseList(head: ListNode): ListNode = {
    var cursor = head
    var nextNode: ListNode = null
    while (cursor != null){
      val node = new ListNode(cursor.x, nextNode)
      nextNode = node
      cursor = cursor.next
    }
    nextNode
  }

  def main(args: Array[String]): Unit = {
    val five = new ListNode(5)
    val four = new ListNode(4, five)
    val three = new ListNode(3, four)
    val two = new ListNode(2, three)
    val one = new ListNode(1, two)
    printList(one)
    var x = reverseList(one)
    printList(x)
    x = reverseList(five)
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


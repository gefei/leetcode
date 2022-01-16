import scala.collection.mutable

object Leet2095 {
  def deleteMiddle(head: ListNode): ListNode = {
    if (head.next == null) return null
    if (head.next.next == null)   {
      return new ListNode(_x = head.x)
    }

    var (slow, fast) = (head, head)
    var prev = new ListNode(_next = slow)
    while (fast != null && fast.next != null) {
      fast = fast.next.next
      slow = slow.next
      prev = prev.next
    }
    prev.next = slow.next
    head
  }

  def main(args: Array[String]): Unit = {
    var five = new ListNode(5)
    var four = new ListNode(4, five)
    var three = new ListNode(3, four)
    var two = new ListNode(2, three)
    var one = new ListNode(1, two)
    printList(one)
    var x = deleteMiddle(one)
    printList(x)

    five = new ListNode(5)
    four = new ListNode(4, five)
    printList(four)
    x = deleteMiddle(four)
    printList(x)

    five = new ListNode(5)
    printList(five)
    x = deleteMiddle(five)
    printList(x)

    five = new ListNode(5)
    four = new ListNode(4, five)
    three = new ListNode(3, four)
    printList(three)
    x = deleteMiddle(three)
    printList(x)

    four = new ListNode(4, null)
    three = new ListNode(3, four)
    two = new ListNode(2, three)
    one = new ListNode(1, two)
    printList(one)
    x = deleteMiddle(one)
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


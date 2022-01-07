import scala.util.Random

class Leet0382(_head: ListNode) {
  val length: Int = {
    var l = 0;
    var n = _head;
    while (n != null) {
      l = l + 1
      n = n.next
    }
    l
  }

  def getRandom(): Int = {
    val r = new Random()
    val n = r.nextInt(length)
    var node = _head;
    var c: Int = 0
    while (c != n) {
      c += 1
      node = node.next
    }
    node.x
  }

}

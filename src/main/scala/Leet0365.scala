// https://leetcode.com/problems/water-and-jug-problem/

class Leet0365 {
  def canMeasureWater(x: Int, y: Int, z: Int): Boolean = {
    val (a, b) = (x.min(y), x.max(y))
    val seen = scala.collection.mutable.HashSet[(Int, Int)]()
    val queue = scala.collection.mutable.Queue[(Int, Int)]()
    queue.enqueue((a, b))
    while (queue.nonEmpty) {
      val (my_x, my_y) = queue.dequeue()
      if (my_x == z || my_y == z) return true
      if (my_x + my_y == z) return true
      seen.add(my_x, my_y)
      val new_1 = (0, my_y)
      val new_2 = (my_x, 0)
      val new_3 = if (my_y > a - my_x) (a, my_y + my_x - a) else (my_x + my_y, 0)
      val new_4 = (a, my_y)
      val new_5 = (my_x, b)
      val children = Array(new_1, new_2, new_3, new_4, new_5)
      for (child <- children) {
        if (!seen.contains(child)) {
          queue.enqueue(child)
        }
      }
    }
    false
  }
}

object Leet0365 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0365()
    println(leet.canMeasureWater(2,6,5))
    println(leet.canMeasureWater(3,5,4))
    println(leet.canMeasureWater(1,2,3))
  }
}

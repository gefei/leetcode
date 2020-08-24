// https://leetcode.com/problems/search-a-2d-matrix-ii/

class Leet0240 {
  def searchMatrix(matrix: Array[Array[Int]], target: Int): Boolean = {
    if (matrix.length == 0) return false
    val (height, width) = (matrix.length, matrix(0).length)
    if (width == 0) return false
    val dirs = Map (
      true  -> Array((1, 0), (0, 1)),
      false -> Array((-1, 0), (0, -1))
    )
    val frontier = new scala.collection.mutable.Queue[(Int, Int)]()
    val seen = new scala.collection.mutable.HashSet[(Int, Int)]()
    val (y_half, x_half) = (height/2, width/2)
    frontier.enqueue((y_half, x_half))
    seen.add((y_half, x_half))
    while (frontier.nonEmpty) {
      val (pos_y, pos_x) = frontier.dequeue()
      val num = matrix(pos_y)(pos_x)
      if (num == target) return true
      val too_small = num < target
      for (d <- dirs(too_small)) {
        val (new_y, new_x) = (pos_y + d._1, pos_x + d._2)
        if (new_y >= 0 && new_y < height
           && new_x >= 0 && new_x < width
           && (!seen.contains((new_y, new_x)))
        ) {
          frontier.enqueue((new_y, new_x))
          seen.add((new_y, new_x))
        }
      }
    }
    return false
  }
}

object Leet0240 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0240()
    var a = Array(
      Array(1,   4,  7, 11, 15),
      Array(2,   5,  8, 12, 19),
      Array(3,   6,  9, 16, 22),
      Array(10, 13, 14, 17, 24),
      Array(18, 21, 23, 26, 30)
    )
    println(leet.searchMatrix(a, 5))
    println(leet.searchMatrix(a, 20))
  }
}

// https://leetcode.com/problems/minimum-path-sum/

class Leet0064 {
  def minPathSum(grid: Array[Array[Int]]): Int = {
    for (y <- 1 until grid.length) {
      grid(y)(0) = grid(y)(0) + grid(y-1)(0)
    }
    for (x <- 1 until grid(0).length) {
      grid(0)(x) = grid(0)(x) + grid(0)(x-1)
    }
    for (y <- 1 until grid.length) {
      for (x <- 1 until grid(y).length) {
        grid(y)(x) = grid(y)(x) + grid(y - 1)(x).min(grid(y)(x-1))
      }
    }
    grid(grid.length-1)(grid(0).length-1)
  }
}

object Leet0064 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0064()
    println(leet.minPathSum(Array(Array(1,3,1), Array(1,5,1), Array(4,2,1))))
  }
}






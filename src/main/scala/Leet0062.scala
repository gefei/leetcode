// https://leetcode.com/problems/unique-paths/

class Leet0062 {
  def uniquePaths(m: Int, n: Int): Int = {
    val dp = new Array[Array[Int]](n)
    for (y <- 0 until n) {
      dp(y) = new Array(m)
    }
    for (y <- dp.indices) {
      dp(y)(0) = 1
    }
    for (x <- dp(0).indices) {
      dp(0)(x) = 1
    }
    for (y <- 1 until dp.length) {
      for (x <- 1 until dp(y).length) {
        dp(y)(x) = dp(y-1)(x) + dp(y)(x-1)
      }
    }
    dp(n-1)(m-1)
  }
}

object Leet0062 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0062()
    println(leet.uniquePaths(3, 2))
    println(leet.uniquePaths(7, 3))
  }
}








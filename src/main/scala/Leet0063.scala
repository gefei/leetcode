// https://leetcode.com/problems/unique-paths-ii/

class Leet0063 {
  def uniquePathsWithObstacles(obstacleGrid: Array[Array[Int]]): Int = {
    val (n, m) = (obstacleGrid.length, obstacleGrid(0).length)
    val dp = new Array[Array[Int]](n)
    for (y <- 0 until n) {
      dp(y) = new Array(m)
    }
    dp(0)(0) = 1 - obstacleGrid(0)(0)
    for (y <- 1 until obstacleGrid.length) {
      dp(y)(0) = if (obstacleGrid(y)(0) == 1) 0 else dp(y-1)(0)
    }
    for (x <- 1 until obstacleGrid(0).length) {
      dp(0)(x) = if (obstacleGrid(0)(x) == 1) 0 else dp(0)(x-1)
    }
    for (y <- 1 until dp.length) {
      for (x <- 1 until dp(y).length) {
        dp(y)(x) = if (obstacleGrid(y)(x) == 1) 0
                   else dp(y-1)(x) + dp(y)(x-1)
      }
    }
    printMat(dp)
    dp(n-1)(m-1)
  }
  def printMat(mat: Array[Array[Int]]): Unit = {
    for (i <- mat.indices) {
      for (j <- mat(0).indices) {
        print(mat(i)(j) + "\t")
      }
      println()
    }
  }
}

object Leet0063 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0063()
    println(leet.uniquePathsWithObstacles(Array(Array(1, 0))))
    println(leet.uniquePathsWithObstacles(Array(Array(0, 0, 0), Array(0,1,0), Array(0,0,0))))
  }
}












// https://leetcode.com/problems/number-of-closed-islands/submissions/

class Leet1254 {
  def closedIsland(grid: Array[Array[Int]]): Int = {
    val seen = new scala.collection.mutable.HashSet[(Int, Int)]()
    val delta = Array(
      (1, 0),
      (0, 1),
      (-1, 0),
      (0, -1)
    )
    def neighbors(y: Int, x: Int): scala.collection.mutable.ListBuffer[(Int, Int)] = {
      val ret = new scala.collection.mutable.ListBuffer[(Int, Int)]()
      for ((dy, dx) <- delta) {
        if (x+dx >= 0 && x+dx < grid(0).length) ret += ((y, x+dx))
        if (y+dy >= 0 && y+dy < grid.length) ret += ((y+dy, x))
      }
      ret
    }

    def dfs(y: Int, x: Int): Unit = {
      grid(y)(x) = -5
      seen.add((y, x))
      for (n <- neighbors(y, x)) {
        if (!seen.contains(n) && grid(n._1)(n._2) == 0) {
          dfs(n._1, n._2)
        }
      }
    }

    def findOne(): (Int, Int) = {
      for (y <- grid.indices) {
        for (x <- grid(y).indices) {
          if (grid(y)(x) == 0) {
            return (y, x)
          }
        }
      }
      (-1, -1)
    }

    for (y <- grid.indices) {
      if (grid(y)(0) == 0) {
        dfs(y, 0)
      }
      if (grid(y)(grid(0).length-1) == 0) {
        dfs(y, grid(0).length-1)
      }
    }
    for (x <- grid(0).indices) {
      if (grid(0)(x) == 0) {
        dfs(0, x)
      }
      if (grid(grid.length-1)(x) == 0) {
        dfs(grid.length-1, x)
      }
    }

    var c = 0
    var one = findOne()
    while (one._1 != -1) {
      c += 1
      dfs(one._1, one._2)
      one = findOne()
    }
    c
  }
}

object Leet1254 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet1254()
    println(leet.closedIsland(Array(
      Array(1,1,1,1,1,1,1,0),
      Array(1,0,0,0,0,1,1,0),
      Array(1,0,1,0,1,1,1,0),
      Array(1,0,0,0,0,1,0,1),
      Array(1,1,1,1,1,1,1,0)
    )))
    println(leet.closedIsland(Array(
      Array(0,0,1,0,0),
      Array(0,1,0,1,0),
      Array(0,1,1,1,0)
    )))
    /*
    println(leet.closedIsland(Array(
        Array(0,0,1,1,0,1,0,0,1,0),
        Array(1,1,0,1,1,0,1,1,1,0),
        Array(1,0,1,1,1,0,0,1,1,0),
        Array(0,1,1,0,0,0,0,1,0,1),
        Array(0,0,0,0,0,0,1,1,1,0),
        Array(0,1,0,1,0,1,0,1,1,1),
        Array(1,0,1,0,1,1,0,0,0,1),
        Array(1,1,1,1,1,1,0,0,0,0),
        Array(1,1,1,0,0,1,0,1,0,1),
        Array(1,1,1,0,1,1,0,1,1,0)
    )))
     */
  }
}

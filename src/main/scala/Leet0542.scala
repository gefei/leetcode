// https://leetcode.com/problems/01-matrix/

object Leet0542 {
  def updateMatrix(mat: Array[Array[Int]]): Array[Array[Int]] = {
    val res = new Array[Array[Int]](mat.length)
    for (i <- mat.indices) {
      res(i) = new Array(mat(i).length)
    }

    for (y <- mat.indices) {
      for (x <- res(y).indices) {
        res(y)(x) = if (mat(y)(x) == 0) 0 else 100000000
      }
    }

    for (y <- 1 until res.length) {
      for (x <- res(y).indices) {
        res(y)(x) = res(y)(x).min(res(y-1)(x)+1)
      }
    }
    for (y <- res.length-2 to 0 by -1) {
      for (x <- res(y).indices) {
        res(y)(x) = res(y)(x).min(res(y+1)(x)+1)
      }
    }
    for (y <- res.indices) {
      for (x <- res(y).length-2 to 0 by -1) {
        res(y)(x) = res(y)(x).min(res(y)(x+1)+1)
      }
    }
    for (y <- res.indices) {
      for (x <- 1 until res(y).length) {
        res(y)(x) = res(y)(x).min(res(y)(x-1)+1)
      }
    }
    res
  }

  def print2dArray(mat: Array[Array[Int]]): Unit = {
    println(mat.map(row => row.mkString(" ")).mkString("\n"))
  }

  def main(args: Array[String]): Unit = {
    val res = updateMatrix( Array(
      Array(1,1,0,0,1,0,0,1,1,0),
      Array(1,0,0,1,0,1,1,1,1,1),
      Array(1,1,1,0,0,1,1,1,1,0),
      Array(0,1,1,1,0,1,1,1,1,1),
      Array(0,0,1,1,1,1,1,1,1,0),
      Array(1,1,1,1,1,1,0,1,1,1),
      Array(0,1,1,1,1,1,1,0,0,1),
      Array(1,1,1,1,1,0,0,1,1,1),
      Array(0,1,0,1,1,0,1,1,1,1),
      Array(1,1,1,0,1,0,1,1,1,1)
    ))
    print2dArray(res)
  }
}



import scala.collection.mutable.ArrayDeque

class Leet0329 {
  def getPosition(n: Int, matrix: Array[Array[Int]]): ArrayDeque[(Int, Int)] = {
    var ret = new ArrayDeque[(Int, Int)]()
    for (i <- matrix.indices) {
      for (j <- matrix(i).indices) {
        if (matrix(i)(j) == n) ret.addOne((i, j))
      }
    }
    return ret
  }
  def longestIncreasingPath(matrix: Array[Array[Int]]): Int = {
    val len = new Array[Array[Int]](matrix.length)
    for (i <- matrix.indices) {
      len(i) = new Array[Int](matrix(i).length)
      for (j <- matrix(i).indices) {
        len(i)(j) = 1
      }
    }
    //println(matrix.map(x => x.mkString(" ")).mkString("\n"))
    // val minValues = matrix.map(row => row.min)
    // if (minValues.isEmpty) return 0
    // val min = minValues.min
    val allNums = matrix.flatten.toSet.toList.sorted
    for (n <- allNums) {
      val allPos =  getPosition(n, matrix)
      for ((y, x) <- allPos) {
        finalizeOne(y, x, matrix, len)
      }
    }
    len.flatten.max
  }
  def finalizeOne(y: Int, x: Int, matrix: Array[Array[Int]], len: Array[Array[Int]]): Unit = {
    val (n, d) = (matrix(y)(x), len(y)(x))
    if (y > 0 && matrix(y-1)(x) > n) len(y-1)(x) = len(y-1)(x).max(d+1)
    if (y < matrix.length - 1 && matrix(y+1)(x) > n) len(y+1)(x) = len(y+1)(x).max(d+1)
    if (x > 0 && matrix(y)(x-1) > n) len(y)(x-1) = len(y)(x-1).max(d+1)
    if (x < matrix(y).length - 1 && matrix(y)(x+1) > n) {
      len(y)(x+1) = len(y)(x+1).max(d+1)
    }
  }
}

object Leet0329 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0329
    val x = Array(Array(10,2,3), Array(2,-3,4))
    println(leet.longestIncreasingPath(x))
    val y = Array( Array(9,9,4), Array(6,6,8), Array(2,1,1))
    println(leet.longestIncreasingPath(y))

    val z = Array( Array(3,4,5), Array(3,2,6), Array(2,2,1))
    println(leet.longestIncreasingPath(z))
  }
}

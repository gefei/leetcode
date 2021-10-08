// https://leetcode.com/problems/perfect-squares/

class Leet0279 {

  def isPerfectSqaure(i: Int): Boolean = {
    val sqrt = Math.sqrt(i)
    sqrt.toInt == sqrt
  }

  def numSquares(n: Int): Int = {
    val arr = new Array[Int](n)
    arr(0) = 1
    for (i <- 2 to n) {
      if (isPerfectSqaure(i)) {
        arr(i-1) = 1
      } else {
        val idx = i - 1
        var min = arr(0) + arr(idx-1)
        for (j <- 0 to idx/2) {
          min = min.min(arr(j) + arr(idx-j-1))
        }
        arr(idx) = min
      }
    }
    arr(n - 1)
  }
}

object Leet0279 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0279()
    //println(leet.numSquares(2))
    //println(leet.numSquares(3))
    //println(leet.numSquares(4))
    //println(leet.numSquares(5))
    //println(leet.numSquares(6))
    //println(leet.numSquares(7))
    //println(leet.numSquares(8))
    //println(leet.numSquares(9))
    //println(leet.numSquares(10))
    println(leet.numSquares(11))
    println(leet.numSquares(12))
    println(leet.numSquares(13))
  }
}



// https://leetcode.com/problems/h-index/

class Leet0274 {
  def hIndex(citations: Array[Int]): Int = {
    val res = new Array[Int](citations.length + 1)
    for (c <- citations) {
      if (c < citations.length) res(c) += 1
      else res(citations.length) += 1
    }
    var count = 0
    for (i <- res.length to 1 by -1) {
      count += res(i-1)
      if (count >= i-1) return i-1
    }
    0
  }
}

object Leet0274 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0274()
    println(leet.hIndex(Array(3, 0, 6, 1, 5)))
    println(leet.hIndex(Array(0)))
  }
}

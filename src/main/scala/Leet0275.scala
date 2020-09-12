// https://leetcode.com/problems/h-index/

class Leet0275 {
  def hIndex(citations: Array[Int]): Int = {
    var c = 0
    var i = citations.length - 1
    while (i >= 0 && citations(i) >= citations.length - i) {
      i = i - 1
      c = c + 1
    }
    c
  }
}

object Leet0275 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0275()
    println(leet.hIndex(Array(0, 1, 3, 5, 6)))
  }
}

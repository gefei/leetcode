// https://leetcode.com/problems/next-greater-element-iii/

class Leet0556 {
  def nextGreaterElement(n: Int): Int = {
    val lst = n.toString
    for (i <- lst.length -2 to 0 by -1) {
      if (lst(i) < lst(i+1)) {
        val firstPart = lst.substring(0, i)
        val pivot= lst(i)
        var (minIdx, m) = (i, Integer.MAX_VALUE)
        for (idx <- i+1 until lst.length) {
          if (lst(idx) < m && lst(idx)> pivot) {
            minIdx = idx
            m = lst(idx)
          }
        }
        val minNext = minIdx
        val nextPart = (lst.substring(i, minNext)  ++ lst.substring(minNext+1)).toSeq.sorted.unwrap
        val newS = firstPart + lst(minNext) + nextPart
        val newLong = newS.toLong
        if (newLong > Integer.MAX_VALUE) return -1 else return newLong.toInt
      }
    }
    -1
  }
}

object Leet0556 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0556
    println(leet.nextGreaterElement(12))
    println(leet.nextGreaterElement(230241))
    println(leet.nextGreaterElement(230421))
    println(leet.nextGreaterElement(21))
    println(leet.nextGreaterElement(12443322))
    println(leet.nextGreaterElement(1999999999))
  }
}

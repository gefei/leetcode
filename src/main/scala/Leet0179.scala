// https://leetcode.com/problems/largest-number/

class Leet0179 {
  def largestNumber(nums: Array[Int]): String = {
    def myLexico(x: String, y: String): Boolean ={
      val a = x.concat(y)
      val b = y.concat(x)
      a > b
    }
    val x = nums.map(_.toString).sortWith(myLexico)
    val y = x.mkString.replaceAll("^0+", "")
    if (y.length == 0) "0" else y
  }
}

object Leet0179 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0179()
    println(leet.largestNumber(Array(10, 2)))
    println(leet.largestNumber(Array(3, 30, 34, 5, 9)))
    println(leet.largestNumber(Array(30, 3)))
    println(leet.largestNumber(Array(12, 121)))
  }
}


// https://leetcode.com/problems/majority-element/
object Leet0169 {
  def majorityElement(nums: Array[Int]): Int = {
    var m = 0
    var c = 0
    for (n <- nums) {
      if (c == 0) {
        m = n
      }
      if (n == m) {
        c = c + 1
      } else {
        c = c - 1
      }
    }
    m
  }

  def main(args: Array[String]): Unit = {
    println(majorityElement(Array(1,2,2,1,1)))
    println(majorityElement(Array(3,3,2,3,1)))
  }
}



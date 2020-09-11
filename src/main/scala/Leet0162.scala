class Leet0162 {
  def findPeakElement(nums: Array[Int]): Int = {
    if (nums.length == 1) return 0
    var last = Integer.MIN_VALUE
    for (i <- nums.indices) {
      var me = nums(i)
      var next = if (i < nums.length - 1) nums(i+1) else Integer.MIN_VALUE
      if (last < me && me > next) return i
      last = me
    }
    -1
  }
}

object Leet0162 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0162
    println(leet.findPeakElement(Array(1,2,3,1)))
    println(leet.findPeakElement(Array(1,2,1,3,5,6,4)))
  }
}



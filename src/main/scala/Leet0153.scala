class Leet0153 {
  def findMin(nums: Array[Int]): Int = {
    if (nums.length == 1) {
      return nums(0)
    }
    val i = (1 until nums.length).dropWhile(x => nums(x-1) <= nums(x))
    if (i.isEmpty) nums(0) else nums(i.head)
  }
}

object Leet0153 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0153()
    println(leet.findMin(Array(1,3,5)))
    println(leet.findMin(Array(2,2,2,0,1)))
  }
}

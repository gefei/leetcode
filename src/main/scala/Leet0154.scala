class Leet0154 {
  def findMin(nums: Array[Int]): Int = {
    if (nums.length == 1) {
      return nums(0)
    }
    val i = (1 until nums.length).dropWhile(x => nums(x-1) <= nums(x))
    if (i.isEmpty) nums(0) else nums(i.head)
  }
}



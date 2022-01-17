object Leet0462 {
  def minMoves2(nums: Array[Int]): Int = {
    if (nums.length <= 1) return 0
    val x = nums.sorted
    val median = x(x.length/2)
    x.map(a => Math.abs(a - median)).sum
  }

  def main(args: Array[String]): Unit = {
    println(minMoves2(Array(1,2,3)))
    println(minMoves2(Array(1,10,2,9)))
  }

}


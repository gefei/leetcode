class Leet0004 {
  def findMedianSortedArrays(nums1: Array[Int], nums2: Array[Int]): Double = {
    var (p1, p2) = (0, 0)
    val total_l = nums1.length + nums2.length
    val target = total_l / 2
    var curN = 0
    if (nums1.length == 0) {
      curN = nums2(0)
    }
    else if (nums2.length == 0) {
      curN = nums1(0)
    }
    else {
      curN = nums1(p1).min(nums2(p2))
    }
    for (i <- 0 until target) {
      val tuple = findNext(nums1, nums2, p1, p2)
      p1 = tuple._1
      p2 = tuple._2
      curN = tuple._3
    }
    val (q1, q2, n) = findNext(nums1, nums2, p1, p2)
    if (total_l % 2 == 1) {
      n
    } else {
      (n + curN) / 2.0
    }
  }

  def findNext(nums1: Array[Int], nums2: Array[Int], p1: Int, p2: Int): Tuple3[Int, Int, Int] = {
    if (p1 == nums1.length) {
      return (p1,p2+1, nums2(p2))
    }
    if (p2 == nums2.length) {
      return (p1+1,p2, nums1(p1))
    }
    if (nums1(p1) < nums2(p2)) {
      (p1+1, p2, nums1(p1))
    } else {
      (p1, p2+1, nums2(p2))
    }
  }
}

object Leet0004 {
  def main(args: Array[String]): Unit = {
    val leet004  = new Leet0004()
    println(leet004.findMedianSortedArrays(Array(1,3,5,7,9), Array(2)))
    println(leet004.findMedianSortedArrays(Array(1,3,7,9), Array(2)))
    println(leet004.findMedianSortedArrays(Array(1,2), Array()))
  }
}
// https://leetcode.com/problems/trapping-rain-water/

class Leet0042 {
  def trap(height: Array[Int]): Int = {
    val end = height.length
    val posMax = getRightMax(height, 0, end)
    var (l, r) = (posMax, posMax)
    var s = 0
    var r_nextMax = r
    while (r_nextMax < end - 1) {
      r_nextMax = getRightMax(height, r+1, end)
      s = s + ((r+1 until r_nextMax) map (x => height(r_nextMax) - height(x))).sum
      r = r_nextMax
    }
    var l_nextMax = l
    while (l_nextMax > 0) {
      l_nextMax = getLeftMax(height, 0, l)
      s = s + ((l_nextMax until l) map (x => height(l_nextMax) - height(x))).sum
      l = l_nextMax
    }
    s
  }
  def getRightMax(height: Array[Int], start: Int, end: Int): Int = {
    var mx = start
    for (i <- start until end) {
      if (height(i) > height(mx)) mx = i
    }
    mx
  }
  def getLeftMax(height: Array[Int], start: Int, end: Int) = {
    var mx = end - 1
    for (i <- (end - 1) to start by -1){
      if (height(i) > height(mx)) mx = i
    }
    mx
  }
}

object Leet0042 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0042()
    println(leet.trap(Array(0,1,0,2,1,0,1,3,2,1,2,1)))
    println(leet.trap(Array(4,2,0,3,2,5)))
  }
}


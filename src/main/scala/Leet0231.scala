class Leet0231 {
  def isPowerOfTwo(n: Int): Boolean = {
    var i: Long = 1
    while (i <= n) {
      if (i == n) return true
      i = i<<1;
    }
    false
  }
}

object Leet0231 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0231
    //println(leet.isPowerOfTwo(16))
    //println(leet.isPowerOfTwo(218))
    println(leet.isPowerOfTwo(1073741825))

  }
}

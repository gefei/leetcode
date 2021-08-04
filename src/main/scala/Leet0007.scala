class Leet0007 {
  def reverse(x: Int): Int = {
    var value = if (x > 0) x else -x
    var s: Int = 0
    while (value > 0) {
      val d: Int = value % 10
      val y = (Int.MaxValue.toDouble - d) / 10
      if (y < s) return 0
      s = s * 10 + d
      value = value / 10
    }
    if (x > 0) s else -s
  }
}

object Leet0007 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0007
    println(leet.reverse(123))
    println(leet.reverse(-123))
    println(leet.reverse(120))
    println(leet.reverse(0))
    println(leet.reverse(1534236469))

  }
}

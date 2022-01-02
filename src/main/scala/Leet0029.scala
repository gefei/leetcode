// https://leetcode.com/problems/container-with-most-water/

class Leet0029 {
  def divide(dividend: Int, divisor: Int): Int = {
    var ret: Long = 0
    val sign: Int = if ((dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)) -1 else 1
    var dividend_l: Long = dividend
    if (dividend_l < 0) dividend_l = -dividend_l
    var divisor_l:  Long = divisor
    if (divisor_l < 0) divisor_l = -divisor_l
    while (dividend_l-divisor_l >= 0) {
      ret += 1
      dividend_l -= divisor_l
    }
    if (sign == -1) ret = -ret
    if (ret > 2147483647) 2147483647
    else if (ret < -2147483647) -2147483648
    else ret.toInt
  }
}

object Leet0029 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0029()
    //println(leet.divide(10, 3))
    //println(leet.divide(7, -3))
    println(leet.divide( -2147483648, -1))
    println(leet.divide(-2147483648, 1))
  }
}







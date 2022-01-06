class Leet0091 {
  def getNum1Digit(me: Char): Int = {
    val value = me - '0'
    if (value == 0) 0 else 1
  }
  def getNum2Digits(left: Char, me: Char): Int = {
    val valueLeft = left - '0'
    val valueMe = me - '0'
    val value = valueLeft * 10 + valueMe
    val x = if (value < 10) 0
            else if (value <= 26) 1
            else 0
    x
  }
  def numDecodings(s: String): Int = {
    if (s.isEmpty) return 0
    if (s(0) == '0') return 0
    val nums: Array[Int] = new Array(s.length)
    nums(0) = getNum1Digit(s(0))
    if (s.length == 1) return nums(0)
    nums(1) = getNum1Digit(s(1)) + getNum2Digits(s(0), s(1))

    for (i <- 2 until s.length) {
      nums(i) = nums(i-2) * getNum2Digits(s(i-1), s(i)) + nums(i-1) * getNum1Digit(s(i))
    }
    nums(s.length - 1)
  }
}

object Leet0091 {
  def main(args: Array[String]): Unit = {
    val leet0091 = new Leet0091()
    println(leet0091.numDecodings("12"))
    println(leet0091.numDecodings("226"))
  }
}



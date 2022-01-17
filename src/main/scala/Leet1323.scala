object Leet1323 {

  def maximum69Number (num: Int): Int = {
    val (left, right) = (num.toString.takeWhile(_ == '9'), num.toString.dropWhile(_ == '9'))
    if (right.isEmpty) return num
    val newRight = '9' +: right.tail
    (left ++ newRight).toInt
  }

  def main(args: Array[String]): Unit = {
    println(maximum69Number(9669))
    println(maximum69Number(9996))
    println(maximum69Number(9999))
    println(maximum69Number(6999))
    println(maximum69Number(6))
    println(maximum69Number(9))
  }

}


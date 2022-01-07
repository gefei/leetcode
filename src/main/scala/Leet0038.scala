object Leet0038 {
  def countAndSay(n: Int): String = {
    if (n == 1) return "1"
    var s = "1"
    for (i <- 1 until n) {
      s = oneRound(s)
    }
    s
  }
  def oneRound(s: String): String = {
    var res = ""
    var i = 0
    while (i < s.length) {
      val ch = s(i)
      var j = i
      var c = 0
      while (j < s.length && s(j) == ch) {
        c += 1
        j += 1
      }
      res = res + c + ch
      i = j
    }
    res
  }
  def main(args: Array[String]): Unit = {
    println(countAndSay(1))
    println(countAndSay(2))
    println(countAndSay(3))
    println(countAndSay(4))
    println(oneRound("21"))
  }
}


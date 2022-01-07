class Leet0006 {
  def convert(s: String, numRows: Int): String = {
    if (s.length <= numRows || numRows == 1) return s
    val range: Range = s.indices
    val dist = numRows * 2 - 2
    (0 until numRows).flatMap(i => range.filter(x => x % dist == i || x % dist == dist - i)).map(s(_)).mkString
  }
}

object Leet0006 {
  def main(args: Array[String]): Unit = {
    val leet0006 = new Leet0006()
    println(leet0006.convert("PAYPALISHIRING", 3))
    println(leet0006.convert("PAYPALISHIRING", 4))
    println(leet0006.convert("A", 1))
    println(leet0006.convert("AB", 1))
  }
}



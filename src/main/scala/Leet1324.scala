object Leet1324 {
  def printVertically(s: String): List[String] = {
    val words: Array[String] = s.split(' ').filter(_.nonEmpty)
    val mLength = words.map(_.length).max
    (0 until mLength).map(i => getVertiWord(words, i)).toList
  }

  def getChar(s: String, i: Int): Char = if (i >= s.length) ' ' else s(i)

  def getVertiWord(strings: Array[String], i: Int): String = {
    strings.map(s => getChar(s, i)).mkString.reverse.dropWhile(_ == ' ').reverse
  }

  def main(args: Array[String]): Unit = {
    println(printVertically("HOW ARE YOU"))
    println(printVertically("TO BE OR NOT TO BE"))
  }

}


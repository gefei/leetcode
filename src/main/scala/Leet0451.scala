import scala.collection.Map

object Leet0451 {
  def frequencySort(s: String): String = {
    val lengthMap = getFreqMap(s)
    val lengthList: List[(Char, Int)] = lengthMap.toList.sortBy(-_._2)
    lengthList.map(x => List.fill(x._2)(x._1).mkString).mkString
  }

  def getFreqMap(s: String): Map[Char, Int] = {
    s.groupBy(identity).map(x => (x._1 -> x._2.length))
  }

  def main(args: Array[String]): Unit = {
    println(frequencySort("aaabbcaa"))
  }
}


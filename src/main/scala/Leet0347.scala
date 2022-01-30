import scala.collection.Map

object Leet0347 {
  def topKFrequent(nums: Array[Int], k: Int): Array[Int] = {
    val map = nums.groupBy(identity).mapValues(_.length)
    val lst = map.toList.sortBy(-_._2)
    lst.take(k).map(x=>x._1).toArray
  }

  def main(args: Array[String]): Unit = {
    println(topKFrequent(Array(1,1,3,2,1,3,2,45,3,3,1), 2).mkString(" "))
    println(topKFrequent(Array(1,1,1,2,2,3), 2).mkString(" "))
  }
}


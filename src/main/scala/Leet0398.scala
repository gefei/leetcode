import scala.util.Random

class Leet0398(_nums: Array[Int]) {
  def pick(target: Int): Int = {
    val indices: List[Int] = _nums.indices.filter(_nums(_) == target).toList
    indices(new Random().nextInt(indices.length))
  }
}

object Leet0398 {
  def main(args: Array[String]): Unit = {
    val arr = Array(1,2,3,3,3)
    val leet0398 = new Leet0398(arr)
    for (i <- 1 to 5) {
      println(leet0398.pick(3))
    }
  }
}

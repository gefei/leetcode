import scala.util.Random

object Leet0470 {
  def rand7(): Int = {
    (new Random() nextInt 7) + 1
  }
  def rand10(): Int = {
    10 * ((rand7() - 1) * 49 + (rand7() -1 ) * 7 + rand7() -1) / 343 + 1
  }

}


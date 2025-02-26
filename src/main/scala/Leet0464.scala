import scala.util.boundary, boundary.break

object Solution {
  def canIWin(maxChoosableInteger: Int, desiredTotal: Int): Boolean = {
    val cache: scala.collection.mutable.HashMap[(Set[Int], Int, Int), Int] = new scala.collection.mutable.HashMap()
    def minMax(moves: Set[Int], score: Int, player: Int): Int = {
      if (desiredTotal == 0) return 1
      if (score >= desiredTotal) return -player
      if (moves.isEmpty) return player
      if (player > 0) {
      boundary:
        for (move <- moves) {
          val newMoves = moves-move
          val newScore = score + move
          val m_score = cache.get(newMoves, newScore, -player)
          m_score match {
            case s: Some[Int] => {
              cache.put((newMoves, newScore, -player), s.value)
              if (s.value == player) break(1)
            }
            case None => {
              val s = minMax(newMoves, newScore, -player)
              cache.put((newMoves, newScore, -player), s)
              if (s == player) break(1)
            }
          }
        }
        return -1
      } else {
      boundary:
        for (move <- moves) {
          val newMoves = moves-move
          val newScore = score + move
          val m_score = cache.get(newMoves, newScore, -player)
          m_score match {
            case s: Some[Int] => {
              cache.put((newMoves, newScore, -player), s.value)
              if (s.value == player) break(-1)
            }
            case None => {
              val s = minMax(newMoves, newScore, -player)
              cache.put((newMoves, newScore, -player), s)
              if (s == player) break(-1)
            }
          }
        }
        return 1
      }
    }
    if (desiredTotal > (maxChoosableInteger*(maxChoosableInteger+1))/2) return false
    minMax((1 to maxChoosableInteger).toSet, 0, player = 1) == 1
  }

   def main(args: Array[String]): Unit = {
     println(canIWin(19, 190))
   }
}

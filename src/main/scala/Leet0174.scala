// https://leetcode.com/problems/dungeon-game/

class Leet0174 {
  def calculateMinimumHP(dungeon: Array[Array[Int]]): Int = {
    val need = new Array[Array[Int]](dungeon.length)
    for (i <- dungeon.indices) {
      need(i) = new Array(dungeon(0).length)
      for (j <- dungeon(0).indices) {
        need(i)(j) = Integer.MAX_VALUE
      }
    }
    val (y, x) = (dungeon.length - 1, dungeon(0).length - 1)
    need(y)(x) = 1 - dungeon(y)(x)
    for (j <- x-1 to 0 by -1) {
       need(y)(j) = need(y)(j).min(need(y)(j+1)-dungeon(y)(j)).max(1).max(-dungeon(y)(j)+1)
    }
    for (i <- y-1 to 0 by -1) {
      need(i)(x) = need(i)(x).min(need(i+1)(x)-dungeon(i)(x)).max(1).max(-dungeon(i)(x)+1)
    }
    for (j <- y-1 to 0 by -1) {
      for (i <- x-1 to 0 by -1) {
        need(j)(i) = (need(j)(i).min(need(j+1)(i)-dungeon(j)(i)).min(need(j)(i+1)-dungeon(j)(i))).max(1)
      }
    }
    printMat(dungeon)
    println("-------------------")
    printMat(need)
    println("===================" +
      "")
    need(0)(0).max(1-dungeon(0)(0)).max(1)
  }

  def printMat(mat: Array[Array[Int]]): Unit = {
    for (i <- mat.indices) {
      for (j <- mat(0).indices) {
        print(mat(i)(j) + "\t")
      }
      println()
    }
  }
}

object Leet0174 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0174()
    println(leet.calculateMinimumHP(Array(Array(-2, -3, 3), Array(-5, -10, 1), Array(10, 30, -5))))
    println(leet.calculateMinimumHP(Array(Array(100))))
    println(leet.calculateMinimumHP(Array(Array(0, 0))))
    println(leet.calculateMinimumHP(Array(Array(2,1), Array(1,-1))))
    println(leet.calculateMinimumHP(Array(Array(1,-2,3), Array(2,-2,-2))))
    println(leet.calculateMinimumHP(Array(Array(1, -3, 3), Array(0, -2, 0), Array(-3, -3, -3))))
    println(leet.calculateMinimumHP(Array(Array(1, -3, 3), Array(0, -2, 0))))
    println(leet.calculateMinimumHP(Array(Array(-3, 5))))
    println(leet.calculateMinimumHP(Array(Array(1), Array(-2), Array(1))))
  }
}




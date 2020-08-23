// https://leetcode.com/problems/number-of-islands/

class Leet0200 {
  def numIslands(grid: Array[Array[Char]]): Int = {
    val pos = getPosition(grid)
    var (y, x) = (pos(0), pos(1))
    var c = 0
    val dirs = Array(
      Array(1, 0),
      Array(-1, 0),
      Array(0, 1),
      Array(0, -1),
    )
    while (y != -1) {
      c += 1
      val queue = scala.collection.mutable.Queue[(Int, Int)]()
      queue.enqueue((y,x))
      grid(y)(x) = 'c'
      while (queue.nonEmpty) {
        val me = queue.dequeue()
        val (me_y, me_x) = me
        //grid(me_y)(me_x) = 'c'
        for (d <- dirs) {
          val (ny, nx) = (me_y + d(0), me_x+d(1))
          if (ny >= 0 && ny < grid.length
              && nx >= 0 && nx < grid(0).length
              && grid(ny)(nx) == '1') {
            queue.enqueue((ny, nx))
            grid(ny)(nx) = 'c'
          }
        }
      }
      val newPos = getPosition(grid)
      y = newPos(0)
      x = newPos(1)
      //printMat(grid)
      //println("---------------------")
    }
    c
  }

  def getPosition(grid: Array[Array[Char]]): Array[Int] = {
    for (y <- grid.indices) {
      for (x <- grid(0).indices) {
        if (grid(y)(x) == '1') return Array(y, x)
      }
    }
    Array(-1, -1)
  }

  def printMat(x: Array[Array[Char]]): Unit = {
    val s: String = x.map(y => y.mkString(" ")).mkString("\n")
    println(s)
  }
}

object Leet0200 {
  def main(args: Array[String]): Unit = {
    val leet = new Leet0200()
    println(
      leet.numIslands(Array(
    Array('1','1','1','1','1','0','1','1','1','1','1','1','1','1','1','0','1','0','1','1'),
        Array('0','1','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','1','1','0'),
        Array('1','0','1','1','1','0','0','1','1','0','1','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','0','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','0','0','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','0','1','1','1','1','1','1','0','1','1','1','0','1','1','1','0','1','1','1'),
        Array('0','1','1','1','1','1','1','1','1','1','1','1','0','1','1','0','1','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','1','0','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','0','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('0','1','1','1','1','1','1','1','0','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','1','0','1','1','1','1','1','1','1','0','1','1','1','1','1','1'),
        Array('1','0','1','1','1','1','1','0','1','1','1','0','1','1','1','1','0','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','1','1','1','0'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','1','0','0'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
        Array('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1')
    )))
  }
}



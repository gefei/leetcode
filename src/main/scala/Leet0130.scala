object Leet0130 {
  def solve(board: Array[Array[Char]]): Unit = {
    val upDown = List(0, board.length - 1).flatMap(y => board(y).indices.map(x => (x, y))).toSet
    val leftRight = (1 until board.length).flatMap(y => List(0, board(y).length-1).map(x => (x,y))).toSet
    val indices = upDown ++ leftRight

    val values = indices.flatMap(c => reachable(board, c._1, c._2))
    for (y <- board.indices) {
      for (x <- board(y).indices){
        if (!values.contains((x, y))) {
          board(y)(x) = 'X'
        }
      }
    }
    val s = board.indices.map(y => board(y).indices.map(x => board(y)(x)).mkString(" ")).mkString("\n")
    println(s)
  }

  def reachable(board: Array[Array[Char]], x: Int, y: Int): Set[(Int, Int)] = {
    def reachableRec(frontier: List[(Int, Int)], visited: Set[(Int, Int)], acc: Set[(Int, Int)]): Set[(Int, Int)] = {
      if (frontier.isEmpty) acc
      else if (visited.contains(frontier.head))  {
        reachableRec(frontier.tail, visited, acc)
      } else {
        val (x,y) = frontier.head
        val neighbors = getNeignbors(x, y).filter(n => !visited.contains(n._1,n._2))
        val c = board(y)(x)
        val newAcc = if (c == 'O') acc + ((x,y)) else acc
        val newFrontier = if (c == 'O') frontier.tail ++ neighbors else frontier.tail
        reachableRec(newFrontier, visited + ((x,y)), newAcc)
      }
    }

    def getNeignbors(x: Int, y: Int): List[(Int, Int)] = {
      val res: List[(Int, Int)] = List((x+1, y), (x-1, y), (x, y-1), (x, y+1))
      res.filter(x  => x._2 >= 0 && x._2 < board.length && x._1 >= 0 && x._1 < board(0).length)
    }

    reachableRec(List((x, y)), Set(), Set())
  }

  def main(args: Array[String]): Unit = {
    val board = Array(
      Array('X','X','X','X'),
      Array('X','O','O','X'),
      Array('X','X','O','X'),
      Array('X','O','X','X')
    )
    solve(board)
  }
}
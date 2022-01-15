import scala.annotation.tailrec

object Leet0925 {
  @tailrec
  def isLongPressedName(name: String, typed: String): Boolean = {
    if (typed.isEmpty && name.nonEmpty) return false
    if (name.length == 1)   {
      return typed.map(_ == name.last).reduce(_ && _)
    }
    if (name.isEmpty) return true
    val nameHead = name.takeWhile(_ == name.head)
    val typedHead = typed.takeWhile(_ == typed.head)
    if (nameHead.length > typedHead.length) return false
    val newName = name.dropWhile(_ == name.head)
    val newTyped = typed.dropWhile(_ == typed.head)
    isLongPressedName(newName, newTyped)
  }

  def main(args: Array[String]): Unit = {
    println(isLongPressedName("alex", "aaleex"))
    println(isLongPressedName("saeed", "ssaaedd"))
    println(isLongPressedName("alex", "aaleexa"))
  }
}
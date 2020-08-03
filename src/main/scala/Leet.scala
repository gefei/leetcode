class Leet {
  def leet001_twoSum(nums: Array[Int], target: Int): Array[Int] = {
    val len = nums.length
    for (i <- Range(0, len)) {
      for (j <- Range(i + 1, len))
        if (nums(i) + nums(j) == target) return Array(i, j)
    }
    Array(-1, -1)
  }

  def leet002_addTwoNumbers(l1: ListNode, l2: ListNode): ListNode = {
    val head = new ListNode()
    var carry = 0
    var p = head
    var p1 = l1
    var p2 = l2
    while (p1 != null && p2 != null) {
      val sum = p1.x + p2.x + carry
      val s = new ListNode(sum % 10)
      carry = sum / 10
      p.next = s
      p1 = p1.next
      p2 = p2.next
      p = s
    }
    while (p1 != null) {
      val sum = p1.x + carry
      val s = new ListNode(sum % 10)
      carry = sum / 10
      p.next = s
      p = s
      p1 = p1.next
    }
    while (p2 != null) {
      val sum = p2.x + carry
      val s = new ListNode(sum % 10)
      carry = sum / 10
      p.next = s
      p = s
      p2 = p2.next
    }
    if (carry > 0) {
      val s = new ListNode(carry)
      p.next = s
    }
    head.next
  }

  // brute force
  def leet003_lengthOfLongestSubstring(s: String): Int = {
     var maxLen = 0
     for (i <- Range(0, s.length)) {
       var j = i + 1
       while (j < s.length &&
              !s.substring(i, j).contains(s.charAt(j)) ) {
           j = j + 1
       }
       if (maxLen < j-i) maxLen = j-i
     }
     maxLen
  }

  // brute force
  // extending from center
  def leet004_longestPalindrome(s: String): String = {
    if (s.length == 0) return ""
    var start = -1
    var end = -1
    var maxLen = 0
    for (i <- Range(0, s.length)) {
      var x = 1
      while (i - x >= 0 && i + x < s.length && s(i-x) == s(i+x)) {
        x += 1
      }
      val len =  2 * x - 1
      if (maxLen < len) {
        maxLen = len
        start = i - x + 1
        end = i + x - 1
      }
    }
    for (i <- Range(0, s.length - 1)) {
      var x = i
      var y = i + 1
      while (x >= 0 && y <= s.length - 1 && s(x) == s(y)) {
        x -= 1
        y += 1
      }
      val len = y - x - 1
      if (maxLen < len) {
        maxLen = len
        start = x + 1
        end = y - 1
      }
    }
    s.substring(start, end+1)
  }

  // https://leetcode.com/problems/jump-game-ii/
  // dynamic programming
  def leet045_jump(nums: Array[Int]): Int = {
    val steps = new Array[Int](nums.length)
    steps(0) = 0

    for (i <- 1 until nums.length) {
      steps(i) = Int.MaxValue
    }
    for (i <- 0 until nums.length) {
      for (j <- i+1 until nums.length.min(i+nums(i) + 1)) {
        steps(j) = steps(j).min(steps(i) + 1)
      }
    }
    steps(steps.length-1)
  }

  // https://leetcode.com/problems/jump-game/
  // dynamic programming
  def leet055_canJump(nums: Array[Int]): Boolean = {
    val steps = new Array[Boolean](nums.length)
    steps(0) = true

    for (i <- 1 until nums.length) {
      steps(i) = false
    }
    for (i <- 0 until nums.length) {
      if (!steps(i)) return false
      for (j <- i+1 until nums.length.min(i+nums(i) + 1)) {
        steps(j) = true
      }
    }
    steps(steps.length-1)
  }

  // https://leetcode.com/problems/jump-game-iii/
  // width first search
  def leet1306_canReach(arr: Array[Int], start: Int): Boolean = {
    val frontier = new scala.collection.mutable.Queue[Int]
    var seen = new scala.collection.mutable.HashSet[Int]
    var idx_zeros = new scala.collection.mutable.HashSet[Int]
    frontier.enqueue(start)
    while (!frontier.isEmpty) {
      val node = frontier.dequeue()
      if (!seen.contains(node)) {
        seen.add(node)
        if (arr(node) == 0) {
          idx_zeros.add(node)
        } else {
          val new_1 = node - arr(node)
          val new_2 = node + arr(node)
          if (new_1 >= 0) {
            frontier.enqueue(new_1)
          }
          if (new_2 < arr.length) {
            frontier.enqueue(new_2)
          }
        }
      }
    }
    !idx_zeros.isEmpty
  }
}

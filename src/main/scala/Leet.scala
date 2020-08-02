class Leet {
  def leet001_twoSum(nums: Array[Int], target: Int): Array[Int] = {
    val len = nums.length
    for (i <- Range(0, len)) {
      for (j <- Range(i + 1, len))
        if (nums(i) + nums(j) == target) return Array(i, j)
    }
    Array(-1, -1)
  }

  // https://leetcode.com/problems/add-two-numbers/
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
}

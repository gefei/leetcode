 import 'dart:math';

class ListNode {
   int val;
   ListNode? next;
   ListNode([this.val = 0, this.next]);
 }

class Solution {
  int pairSum(ListNode? head) {
    ListNode? rev = reversed(head);
    int maxSum = 0;
    ListNode? c1 = head;
    ListNode? c2 = rev;
    while (c1 != null && c2 != null) {
      int s = c1.val + c2.val;
      maxSum = max(maxSum, s);
      c1 = c1.next;
      c2 = c2.next;
    }
    return maxSum;
  }

  ListNode reversed(ListNode? head) {
    ListNode newHead = ListNode();
    var cur = head;
    while (cur != null) {
      newHead = ListNode(cur.val, newHead);
      cur = cur.next;
    }
    return newHead;
  }
}

void main() {
  ListNode n = ListNode(1);
  n = ListNode(2, n);
  n = ListNode(4, n);
  n = ListNode(5, n);
  Solution solution = Solution();
  print(solution.pairSum(n));
  n = ListNode(3);
  n = ListNode(2, n);
  n = ListNode(2, n);
  n = ListNode(4, n);
  print(solution.pairSum(n));
  n = ListNode(100000);
  n = ListNode(1, n);
  print(solution.pairSum(n));
}
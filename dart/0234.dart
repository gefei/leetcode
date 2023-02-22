// import 'package:stack/stack.dart';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  bool isPalindrome(ListNode? head) {
    var rList = reversed(head);
    return isEqual(head, rList);
  }

  bool isEqual(ListNode? head, ListNode? rev) {
    var cur1 = head;
    var cur2 = rev;
    while (cur1 != null && cur2 != null) {
      if (cur1.val != cur2.val) return false;
      cur1 = cur1.next;
      cur2 = cur2.next;
    }
    return true;
  }

  void printList(ListNode? head) {
    var cur = head;
    String s = "";
    while (cur != null) {
      s += "${cur.val},";
      cur = cur.next;
    }
    print(s);
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
  Solution solution = Solution();
  ListNode node = ListNode(1);
  node = ListNode(2, node);
  node = ListNode(2, node);
  node = ListNode(1, node);
  print(solution.isPalindrome(node));
  node = ListNode(2);
  node = ListNode(1, node);
  print(solution.isPalindrome(node));
}


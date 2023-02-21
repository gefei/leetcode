class Solution {
  bool isPalindrome(int x) {
    String s = x.toString();
    String t = s.split('').reversed.join();
    return t == s;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.isPalindrome(12));
  print(solution.isPalindrome(11));
  print(solution.isPalindrome(1));
  print(solution.isPalindrome(121));
}
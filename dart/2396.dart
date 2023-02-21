class Solution {
  bool isStrictlyPalindromic(int n) {
    for (var i = 2; i <= n-2; i++) {
      String s = n.toRadixString(i);
      if (!isPalin(s)) {
        return false;
      }
    }
    return true;
  }

  bool isPalin(String s) {
    return s.split('').reversed.join() == s;
  }

}

void main() {
  Solution solution = Solution();
  print(!solution.isStrictlyPalindromic(9));
  print(!solution.isStrictlyPalindromic(4));
}
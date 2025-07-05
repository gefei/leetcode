class Solution:
    def numDupDigitsAtMostN(self, n: int) -> int:
        return n - self.countSpecialNumbers(n)

    def countSpecialNumbers(self, n: int) -> int:
        num_s = str(n)
        res = 0
        num_digits = len(num_s)
        for i in range(1, num_digits):
            res = res + self.get_n(i, set())
        return res + self.partial(num_s, set())
    
    def get_n(self, num_d: int, ex: set) -> int:
        excluded = len(ex)
        res = 9 if excluded == 0 else 10 - excluded
        cur = 9 if excluded == 0 else res - 1
        for i in range(2, num_d+1):
            res = res * cur
            cur = cur - 1
        return res

    def partial(self, num_s: str, ex: set):
        res = 0
        num_digits = len(num_s)
        start = 1 if len(ex) == 0 else 0
        first = int(num_s[0])
        if num_digits == 1:
            return len(set(range(start, first+1)).difference(ex))
        for i in range(start, first):
            if i not in ex:
                ex_1 = ex.copy()
                ex_1.add(i)
                res = res + self.get_n(num_digits-1, ex_1)
        if first not in ex:
            ex_1 = ex.copy()
            ex_1.add(first)
            res = res + self.partial(num_s[1:], ex_1)
        return res
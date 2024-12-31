class Solution:
    def brokenCalc(self, startValue: int, target: int) -> int:
        if target <= startValue:
            return startValue - target
        c = target
        cnt = 0
        while c > startValue:
            if c%2 == 0:
                c = c // 2
            else:
                c += 1
            cnt += 1
        return cnt + startValue - c

s = Solution()
print(s.brokenCalc(2,3))
print(s.brokenCalc(5,8))
print(s.brokenCalc(3,10))
print(s.brokenCalc(1024, 1))
print(s.brokenCalc(3, 1000000000))
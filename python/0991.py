import queue
class Solution:
    def brokenCalc(self, startValue: int, target: int) -> int:
        if target < startValue:
            return startValue - target
        res = dict()
        cost = 0
        c = startValue
        for i in range(c, c//2, -1):
            res[i] = cost
            cost += 1
        while c < target:
            for i in range(c, c//2, -1):
                res[i+i] = res[i] + 1
                if i+i == target:
                    return res[i+i]
                del res[i]
                if i+i-1 == c: break
                res[i+i-1] = res[i+i] + 1
                if i+i-1 == target:
                    return res[i+i-1]

            c = c + c
        return res[target]

s = Solution()
print(s.brokenCalc(2,3))
print(s.brokenCalc(5,8))
print(s.brokenCalc(3,10))
print(s.brokenCalc(1024, 1))
#print(s.brokenCalc(3, 1000000000))
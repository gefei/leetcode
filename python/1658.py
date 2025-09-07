import bisect

class Solution:
    def minOperations(self, nums: list[int], x: int) -> int:
        s = 0
        left = [0]
        for n in nums:
            s = s + n 
            if s > x: break
            left.append(s)
        s = 0
        right = [0]
        for i in range(len(nums)-1, -1, -1):
            s = s + nums[i]
            if s > x: break
            right.append(s)
        mn = len(left) + len(right)
        found = False
        for i in range(len(left)):
            j = bisect.bisect_left(right, x-left[i])
            if i+j >= len(nums)+1: continue
            if j >= len(right): continue
            if left[i] + right[j] == x and mn > i+j: 
                found = True
                mn = i+j
        return mn if found else -1
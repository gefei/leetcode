import heapq

class Solution:
    def halveArray(self, nums: list[int]) -> int:
        n = [-x for x in nums]
        heapq.heapify(n)
        s = sum(nums)
        s1 = 0
        c = 0
        while s1 < s:
            x = heapq.heappop(n)
            s1 += -x
            heapq.heappush(n, x/2)
            c += 1
        return c
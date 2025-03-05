import heapq

class Solution:
    def minOperations(self, nums: list[int], k: int) -> int:
        c = 0
        heapq.heapify(nums)
        while nums[0] < k:
            c += 1
            x = heapq.heappop(nums)
            y = heapq.heappop(nums)
            heapq.heappush(nums, x*2+y)
        return c
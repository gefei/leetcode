import heapq
import math

class Solution:
    def minStoneSum(self, piles: list[int], k: int) -> int:
        p = [-x for x in piles]
        heapq.heapify(p)
        s = 0
        for i in range(k):
            x = heapq.heappop(p) 
            h = math.ceil(x / 2)
            s += h
            heapq.heappush(p, x-h)
        return -sum(p)
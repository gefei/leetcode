import heapq
import math

class Solution:
    def maxKelements(self, piles: list[int], k: int) -> int:
        p = [-x for x in piles]
        heapq.heapify(p)
        s = 0
        for i in range(k):
            x = heapq.heappop(p) 
            s += x
            h = x // 3
            heapq.heappush(p, h)
        return -s
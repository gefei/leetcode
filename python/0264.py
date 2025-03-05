from heapq import heappush, heapify, heappop

class Solution:
    def nthUglyNumber(self, n):
        s = set([1])
        h = [1]
        cnt = 0
        while (cnt < n):
            t = heappop(h)
            candis = set([t*2, t*3, t*5]) - s
            for c in candis:
                heappush(h, c)
                s.add(c)
            cnt += 1
        return t
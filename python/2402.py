import heapq

class Solution:
    def mostBooked(self, n: int, meetings: list[list[int]]) -> int:
        meetings.sort(key=lambda a: a[0])
        q = [(0, i, 0) for i in range(n)]
        for [a,b] in meetings:
            update = []
            while len(q) > 0:
                (time, idx, count) = q[0]
                if time <= a:
                    (time, idx, count) = heapq.heappop(q)
                    update.append((0, idx, count))
                else: break
            for x in update:
                heapq.heappush(q, x)

            (time, idx, count) = heapq.heappop(q)
            nt = b - a + (time if time > a else a)
            heapq.heappush(q, (nt, idx, count+1))
        mx = 0
        i = 0
        for (t, idx, count) in q:
            if mx < count: 
                mx = count
                i = idx
            elif mx == count and i > idx:
                i = idx
        print(q)
        return i

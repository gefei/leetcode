import heapq

class Solution:
    def maxAverageRatio(self, classes: list[list[int]], extraStudents: int) -> float:
        q = [(-(b-a)/(b*(b+1)), (a, b)) for [a,b] in classes]
        heapq.heapify(q)
        for i in range(extraStudents):
            (_, (a, b)) = heapq.heappop(q)
            a = a + 1
            b = b + 1
            heapq.heappush(q, (-(b-a)/(b*(b+1)), (a,b)))

        x = [a/b for (_, (a,b)) in q]
        return sum(x)/len(x)

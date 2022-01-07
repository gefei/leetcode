import heapq

class MedianFinder:
    def __init__(self):
        self.small, self.big = [], []
        heapq.heapify(self.big)
        heapq.heapify(self.small)

    def addNum(self, num: int) -> None:
        if len(self.small) == 0 or num > -self.small[0]:
            heapq.heappush(self.big, num)
        else:
            heapq.heappush(self.small, -num)
            x = -heapq.heappop(self.small)
            heapq.heappush(self.big, x)
        if len(self.big) > len(self.small):
            x = heapq.heappop(self.big)
            heapq.heappush(self.small, -x)

    def findMedian(self) -> float:
        if len(self.big) < len(self.small): return -self.small[0]
        x, y = heapq.nsmallest(1, self.big)[0], -self.small[0]
        return (x + y) / 2

if __name__ == '__main__':
    median_finder = MedianFinder()
    median_finder.addNum(40)
    print(1, median_finder.findMedian())
    median_finder.addNum(12)
    print(2, median_finder.findMedian())
    median_finder.addNum(16)
    print(3, median_finder.findMedian())



from heapq import *

class NumberContainers:
    def __init__(self):
        self.num_to_idx = dict()
        self.idx_to_num = dict()

    def change(self, index: int, number: int) -> None:
        if index in self.idx_to_num and self.idx_to_num[index] == number: return
        self.idx_to_num[index] = number
        self.num_to_idx.setdefault(number, [])
        st = self.num_to_idx[number]
        heappush(st, index)

    def find(self, number: int) -> int:
        s = self.num_to_idx.get(number)
        if s is None: return -1
        while len(s) != 0 and self.idx_to_num[s[0]] != number:
            heappop(s)
        if len(s) == 0: return -1
        return s[0]
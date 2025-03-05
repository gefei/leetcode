import bisect
import random

class Solution:
    def __init__(self, w: list[int]):
        s = sum(w)
        self.p = [0] * len(w)
        partial = 0
        for i in range(len(w)):
            partial += w[i]
            self.p[i] = partial/s

    def pickIndex(self) -> int:
        p = random.random()
        return bisect.bisect_left(self.p, p)
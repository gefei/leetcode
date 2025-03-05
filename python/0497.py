import random
import bisect

class Solution:
    def __init__(self, rects: list[list[int]]):
        self.rects = rects
        areas = [(x2-x1+1)*(y2-y1+1) for [x1, y1, x2, y2] in rects]
        s = sum(areas)
        self.p = [0] * len(rects)
        p_s = 0
        for i in range(len(rects)):
            p_s += areas[i]
            self.p[i] = p_s / s


    def pick(self) -> list[int]:
        p = random.random()
        i = bisect.bisect_left(self.p, p)
        r = self.rects[i]
        x = random.randint(r[0], r[2])
        y = random.randint(r[1], r[3])
        return [x, y]
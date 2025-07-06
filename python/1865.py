from collections import Counter
class FindSumPairs:
    def __init__(self, nums1: list[int], nums2: list[int]):
        self.nums1 = nums1
        self.nums2 = nums2
        self.keys1 = sorted([x for x in set(self.nums1)])
        self.map1  = Counter(self.nums1)
        
        self.map2 = dict()
        for k in self.nums2:
            c = self.map2.get(k, 0)
            self.map2[k] = c + 1

    def add(self, index: int, val: int) -> None:
        old = self.nums2[index]
        old_c = self.map2.get(old, 1)
        self.map2[old] = old_c - 1
        new = old + val
        new_c = self.map2.get(new, 0)
        self.nums2[index] = new
        self.map2[new] = new_c+1
        
    def count(self, tot: int) -> int:
        res = 0
        for k1 in self.map1:
            c = self.map2.get(tot-k1, 0)
            res = res + c*self.map1[k1]
        return res
class Solution:
    def valueAfterKSeconds(self, n: int, k: int) -> int:
        return self.step(k+1, n, 0, 1)

    def step(self, k, n, cur_n, acc):
        if n-1 == cur_n: return acc % 1_000_000_007
        new_acc = k*acc // (cur_n+1) 
        return self.step(k+1, n, cur_n+1, new_acc)
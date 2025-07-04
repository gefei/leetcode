import math

class Solution:
    def kthCharacter(self, k: int, operations: list[int]) -> str:
        if (k==1): return 'a'
        len = math.log2(k)
        if (len != int(len)): len = int(len) + 1
        len = int(len)
        return self.step(k, operations, len-1)

    def step(self, k, operations, pos): 
        if k==1: return 'a'
        rest = k - (1<<pos) 
        if rest == 0:
            t = self.step(k//2, operations, pos-1)
            t_n = ord(t)
            num = (t_n - 97 + operations[pos-1]) % 26 + 97
            return chr(num)
        len = math.log2(rest)
        if (len != int(len)): len = int(len) + 1
        len = int(len)
        if (rest == 1): len = 1
        new_pos = len-1
        t = self.step(rest, operations, new_pos)
        t_n = ord(t)
        num = (t_n - 97 + operations[pos]) % 26 + 97
        return chr(num)
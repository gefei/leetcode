class Solution:
    def bfs(self, arr: list[int], m: dict[int, list[int]]):
        seen: set[int] = set()
        q: list[int] = list()
        q.append([0,0])
        q_set: set[int] = set()
        q_set.add(0)
        while (len(q) > 0):
            (cur,step)  = q.pop(0)
            if cur == len(arr)-1: return step
            if cur in seen: continue
            seen.add(cur)
            candis: list[int] = [cur-1, cur+1]
            map_candis: list[int] = m[arr[cur]]
            if map_candis is not None:
                candis.extend(map_candis)
                m[arr[cur]] = None
            for can in candis:
                if can == len(arr) - 1: return step+1
                if can < 0: continue
                if can > len(arr) - 1: continue
                if not can in seen and not can in q_set: 
                    q.append((can, step+1))
                    q_set.add(can)
        
    def make_map(self, arr: list[int]):
        d = dict()
        for (i, e) in enumerate(arr):
            v = d.get(e)
            if v is None:
                v = [i]
                d[e] = v 
            else: v.append(i)
        return d

    def minJumps(self, arr: list[int]) -> int:
        m = self.make_map(arr)
        return self.bfs(arr, m)

s = Solution()
print(s.minJumps([100,-23,-23,404,100,23,23,23,3,404]))
print(s.minJumps([7,6,9,6,9,6,9,7]))
print(s.minJumps([7]))
print(s.minJumps([1,2,1,2,7,11]))
        
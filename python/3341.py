import heapq

class Solution:
    def minTimeToReach(self, moveTime: list[list[int]]) -> int:
        seen = set()
        (height, width) = (len(moveTime), len(moveTime[0]))
        q = [(height+width-2, 0, {'t': 0, 'x': 0, 'y': 0, 'step': 1, 'esti': height+width-2})]
        self.n = 0
        while len(q) != 0:
            esti, r, cur = heapq.heappop(q)
            if cur['x'] == width-1 and cur['y'] == height-1:
                return cur['t']
            if (cur['y']*width + cur['x']) in seen: continue
            seen.add(cur['y']*width+cur['x'])
            self.update_q(cur, moveTime, height, width, q, seen)

    def update_q(self, cur, moveTime, h, w, q, seen):
        (t, x, y, step) = (cur['t'], cur['x'], cur['y'], cur['step'])
        if x < w-1 and y*w+x+1 not in seen:
            new_x = x + 1
            c = moveTime[y][new_x]
            next_t = step + max(t, c) 
            esti =  next_t + h-y + w-new_x - 2
            self.n += 1
            heapq.heappush(q, (esti, self.n, {'t': next_t, 'x': new_x, 'y': y, 'esti': esti, 'step': 3-step}), )
        if x > 0 and y*w+x-1 not in seen:
            new_x = x - 1
            c = moveTime[y][new_x]
            next_t = step + max(t, c) 
            esti =  next_t + h-y + w-new_x - 2
            self.n += 1
            heapq.heappush(q, (esti, self.n, {'t': next_t, 'x': new_x, 'y': y, 'esti': esti, 'step': 3-step}),)
        if y < h-1 and (y+1)*w+x not in seen:
            c = moveTime[y+1][x]
            next_t = step + max(t, c) 
            esti =  next_t + h-y-1 + w-x - 2
            new_c = {'t': next_t, 'x': x, 'y': y+1, 'esti': esti, 'step': 3-step}
            self.n += 1
            heapq.heappush(q, (esti, self.n, new_c),)
        if y > 0 and (y-1)*w+x not in seen:
            c = moveTime[y-1][x]
            next_t = step + max(t, c) 
            esti =  next_t + h-y+1 + w-x - 2
            self.n += 1
            heapq.heappush(q, (esti, self.n, {'t': next_t, 'x': x, 'y': y-1, 'esti': esti, 'step': 3-step}),)
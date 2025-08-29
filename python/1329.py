class Solution:
    def diagonalSort(self, grid: list[list[int]]) -> list[list[int]]:
        height = len(grid)
        width = len(grid[0])
        index_starts = [(0,x) for x in range(height-1, 0, -1)]
        index_starts.extend([x, 0] for x in range(width))
        indexes = [get_index_line(x, height, width) for x in index_starts]
        arrays = [get_nums(grid, x) for x in indexes]
        len_arrays = len(arrays)
        for i in range(len_arrays):
            arrays[i].sort(reverse=False)
        for i in range(len(indexes)):
            for j in range(len(indexes[i])):
                (x,y) = indexes[i][j]
                grid[y][x] = arrays[i][j]
        return grid

def get_index_line(start, height, width):
    res = []
    (x,y) = start
    while x < width and y < height:
        res.append((x, y))
        x = x + 1
        y = y + 1
    return res

def get_nums(grid, idx):
    return [grid[y][x] for (x,y) in idx]
var maxAreaOfIsland = function(grid) {
    const width = grid[0].length
    function pos_to_hash(x, y) {
        return y*width + x
    }
    function has(seen, x, y) {
        return (seen.has(pos_to_hash(x, y)))
    }
    function add(seen, x, y) {
        seen.add(pos_to_hash(x, y))
    }
    function get_neighbors(x, y) {
        const res = []
        if (x > 0 && grid[y][x-1] === 1) {
            res.push([x-1, y])
        }
        if (x < grid[y].length-1 && grid[y][x+1] === 1) {
            res.push([x+1, y])
        }
        if (y > 0 && grid[y-1][x] === 1) {
            res.push([x, y-1])
        }
        if (y < grid.length-1 && grid[y+1][x] === 1) {
            res.push([x, y+1])
        }
        return res
    }
    function bfs(x, y) {
        const visited = new Set()
        const queue = [[x, y]]
        while (queue.length !== 0) {
            let [nx, ny] = queue.shift()
            if (has(visited, nx, ny)) continue
            add(visited, nx, ny)
            const n = get_neighbors(nx, ny)
            for ([px, py] of n) {
                if (!has(visited, px, py)) {
                    queue.push([px, py])
                }
            }
        }
        return visited
    }
    function main(board) {
        let max = 0
        const all = new Set()
        let coordis = new Set()
        for (let y = 0; y < board.length; y++) {
            for (let x = 0; x < board[y].length; x++) {
                if (coordis.has(y*width+x)) continue
                if (board[y][x] === 1) {
                    let s = bfs(x, y)
                    coordis = coordis.union(s)
                    if (max < s.size) max = s.size
                }
            }
        }
        return max
    }
    return main(grid)
};

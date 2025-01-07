var countBattleships = function(board) {
    const width = board[0].length
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
        if (x > 0 && board[y][x-1] === 'X') {
            res.push([x-1, y])
        }
        if (x < board[0].length-1 && board[y][x+1] === 'X') {
            res.push([x+1, y])
        }
        if (y > 0 && board[y-1][x] === 'X') {
            res.push([x, y-1])
        }
        if (y < board.length-1 && board[y+1][x] === 'X') {
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
            for ([px, py] of get_neighbors(nx, ny)) {
                if (!has(visited, px, py)) {
                    queue.push([px, py])
                }
            }
        }
        return visited
    }
    function main(board) {
        const all = new Set()
        for (let y = 0; y < board.length; y++) {
            for (let x = 0; x < board[y].length; x++) {
                if (board[y][x] === 'X') {
                    let s = bfs(x, y)
                    const m = Math.min.apply(null, [...s])
                    if (!all.has(m)) {
                        all.add(m)
                    }
                }
            }
        }
        return all.size
    }
    return main(board)
};

board = [["X",".",".","X"],
         [".",".",".","X"],
         [".",".",".","X"]] 
console.log(countBattleships(board))
board = [["."]]
console.log(countBattleships(board))

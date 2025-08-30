var isValidSudoku = function(board) {
    for (let y = 0; y < 9; y++) {
        if (!row_ok(board, y)) return false
        if (!column_ok(board, y)) return false
    }
    for (let y = 0; y < 9; y+=3) {
        for (let x = 0; x < 9; x+=3) {
            if (!square_ok(board, y, x)) return false
        }
    }
    return true
};

function row_ok(board, y) {
    const seen = {}
    for (let x = 0; x < 9; x++) {
        const sign = board[y][x]
        if (sign === '.') continue
        const me = seen[sign]
        if (me !== undefined) return false
        seen[sign] = true
    }
    return true
}

function column_ok(board, y) {
    const seen = {}
    for (let x = 0; x < 9; x++) {
        const sign = board[x][y]
        if (sign === '.') continue
        const me = seen[sign]
        if (me !== undefined) return false
        seen[sign] = true
    }
    return true
}

function square_ok(board, y, x) {
    const seen = {}
    for (let y1 = 0; y1 < 3; y1++) {
        for (let x1 = 0; x1 < 3; x1++) {
            const sign = board[y+y1][x+x1]
            if (sign === '.') continue
            const me = seen[sign]
            if (me !== undefined) return false
            seen[sign] = true
        }
    }
    return true
}
var findDiagonalOrder = function(mat) {
    const res = []
    const height = mat.length
    const width = mat[0].length
    let x = 0
    let y = 0
    let up = true
    for (let i = 0; i < height*width; i++) {
        res.push(mat[y][x])
        if (up) {
            if (x === width-1) {
                y = y + 1
                up = false
            } else if (y === 0) {
                x = x + 1
                up = false
            } else {
                y = y - 1
                x = x + 1
            }
        } else {
            if (y === height - 1) {
                x = x + 1
                up = true
            } else if (x === 0) {
                y = y + 1
                up = true
            } else {
                y = y + 1
                x = x - 1
            }
        }
    }
    return res
};
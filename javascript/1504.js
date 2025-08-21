var numSubmat = function(mat) {
    const sum_mat = []
    for (let arr of mat) {
        const row = []
        let s = 0
        for (let t of arr) {
            s = s + t
            row.push(s)
        }
        sum_mat.push(row)
    }
    for (let i = 1; i < sum_mat.length; i++) {
        for (let j = 0; j < sum_mat[i].length; j++) {
            sum_mat[i][j] = sum_mat[i][j] + sum_mat[i-1][j]
        }
    }
    let s = 0
    for (let y = 0; y < sum_mat.length; y++) {
        for (let x = 0; x < sum_mat[y].length; x++) {
            if (mat[y][x] === 0) continue
            for (let y1 = y; y1 < sum_mat.length; y1++) {
                let max_x = sum_mat[0].length
                for (let x1 = x; x1 <= max_x; x1++) {
                    const up = (y >= 1) ? sum_mat[y-1][x1] : 0
                    const left = (x >= 1) ? sum_mat[y1][x-1] : 0
                    const corner = (x>=1 && y>=1) ? sum_mat[y-1][x-1] : 0
                    if ((y1-y+1) * (x1-x+1) === sum_mat[y1][x1] - up - left + corner) {
                        s = s + 1
                    } else {
                        break
                    }
                }
            }
        }
    }
    return s
};
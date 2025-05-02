var pushDominoes = function(dominoes) {
    let p = -1
    let left = 'L'
    let res = ''
    // dominoes = dominoes + 'R'  // TODO
    const len = dominoes.length
    while (p < len-1) {
        let q = p + 1
        while (q < len && dominoes[q] === '.') {
            q++
        }
        let right = dominoes[q]
        if (left === 'L') {
            if (right === 'L') {
                res = res.padEnd(res.length + q-p, 'L')
            } else if (right === 'R') {
                res = res.padEnd(res.length + q-p-1, '.')  + 'R'
            } else {
                res = res.padEnd(len, '.') 
            }
        } else { // left == 'R'
            if (right === 'R') {
                res = res.padEnd(res.length + q-p, 'R')
            } else if (right === 'L') {
                const diff = q - p - 1
                const half = diff >> 1
                res = res.padEnd(res.length + half, 'R')
                if (diff & 1) {
                    res = res + '.'
                }
                res = res.padEnd(res.length + half, 'L')  + 'L'
            } else {  // right == '.'
                res = res.padEnd(len, 'R')
            }
        }
        p = q
        left = dominoes[p]
    }
    return res
};
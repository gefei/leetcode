var grayCode = function(n) {
    if (n === 1) return [0, 1]
    let res = [0,1]
    for (let i = 2; i <= n; i++) {
        const len = res.length
        const add = 2**(i-1)
        for (let j = len-1; j >= 0; j--) {
            res.push(add+res[j])
        }
    }
    return res
};
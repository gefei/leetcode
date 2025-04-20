var grayCode = function(n) {
    const used = Array(n).fill(false)
    const res = [0]
    used[0] = true
    return rec(res, used, n, 1)
};

function rec(res, used, len, pos) {
    if (pos === 2**len) {
        return res
    }
    const last = res[pos-1]
    for (let i = 0; i < len; i++) {
        let bin = (last).toString(2)
        bin = bin.padStart(len, '0')
        const c = bin[i]
        const d = (c==='0')?'1':'0'
        bin = bin.slice(0, i) + d + bin.slice(i+1)
        const t = parseInt(bin, 2)
        if (!used[t]) {
            res[pos] = t
            used[t] = true
            return rec(res, used, len, pos+1)
            res[pos] = undefined
            used[t] = false
        }
    }
}

console.log(grayCode(2))
var lexicalOrder = function(n) {
    const res = []
    rec('', n+'', 1, res)
    return res
};

function rec(p, n, start, res) {
    if (n === '') return
    const a = n[0]
    for (let i = start; i < +a; i++) {
        const prefix = p+i+''
        res.push(+prefix)
        full(prefix, n.length-1, res)
    }
    res.push(+(p+a))
    const y = n.slice(1)
    rec(p+a, y, 0, res)
    if (n.length>1) {
        for (let i = a-'0'+1; i<=9; i++) {
            const prefix = p+i+''
            res.push(+prefix)
            full(prefix, n.length-2, res)
        }
    }
}

function full(first, n, res) {
    if (n <= 0) return
    for (let i = 0; i <= 9; i++) {
        const prefix = first + i
        res.push(+prefix)
        full(prefix, n-1, res)
    }
}
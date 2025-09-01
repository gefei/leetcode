var getKth = function(lo, hi, k) {
    const map = {1: 0}
    const res = []
    for (let i = lo; i <= hi; i++) {
        res.push({n: i, p: get_power(i, map)})
    }
    res.sort(
        ({n: n1, p: p1}, {n: n2, p: p2}) => {
            return p1-p2 + ((p2===p1)?(n1-n2):0)
        })
    return res[k-1].n
};

function get_power(n, map) {
    if (n === 1) {
        return 0
    }
    let x = map[get_next(n)]
    if (x !== undefined) {
        map[n] = x+1
        return x+1
    } 
    map[n] = get_power(get_next(n), map) + 1
    return map[n]
}

function get_next(n) {
    if (n === 1) return 1
    if (n%2 === 1) {
        return 3 * n + 1
    } else {
        return n >>> 1
    }
}

var partitionLabels = function(s) {
    const res = []
    const seen = new Set()
    seen.add(s[0])
    let lo = 1, hi = s.lastIndexOf(s[0])
    let last = 0
    while (lo <= s.length-1) {
        while (lo <= hi) {
            const c = s[lo]
            if (!seen.has(c)) {
                seen.add(c)
                hi = Math.max(s.lastIndexOf(c), hi)
            }
            lo++
        }
        hi = s.lastIndexOf(s[lo])
        res.push(lo-last)
        last = lo
    }
    return res
};
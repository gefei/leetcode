var queryResults = function(limit, queries) {
    const res = []
    const keys = new Set()
    const vals = new Set()
    const val_count = {}
    const overall = {}
    let sz = 0
    for (const [k, v] of queries) {
        if (keys.has(k) && vals.has(v)) {
            const old_v = overall[k]
            if (v === old_v) {
                res.push(sz)
                continue
            }
            val_count[old_v]--
            if (val_count[old_v] === 0) {
                vals.delete(old_v)
                sz--
            }
            val_count[v]++
            overall[k] = v
        } else if (keys.has(k)) {
            const old_v = overall[k]
            val_count[old_v]--
            if (val_count[old_v] === 0) {
                vals.delete(old_v)
            } else {
                sz++
            }
            vals.add(v)
            val_count[v] = 1
            overall[k] = v
        } else if (vals.has(v)) {
            keys.add(k)
            val_count[v]++
            overall[k] = v
        } else {
            keys.add(k)
            vals.add(v)
            sz++
            val_count[v] = 1
            overall[k] = v
        }
        res.push(sz)
    }
    return res
};
console.log(queryResults(2, [[0,1],[1,1],[2,4],[0,4],[1,2]]))
console.log(queryResults(1, [[0,1],[1,4],[1,1],[1,4],[1,1]]))
console.log(queryResults(1, [[0,1],[0,4],[0,4],[0,1],[1,2]]))
console.log(queryResults(4, [[0,1],[0,4],[1,2],[1,5],[1,4]]))
console.log(queryResults(4,  [[1,4],[2,5],[1,3],[3,4]]))
console.log(queryResults(4,  [[0,1],[1,2],[2,2],[3,4],[4,5]]))
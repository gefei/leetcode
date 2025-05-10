var findAnagrams = function(s, p) {
    const target = {}
    for (let c of p) {
        let x = target[c]
        if (x === undefined) x = 0
        target[c] = x + 1
    }
    const res = []
    let cur = {}
    let start = 0
    let idx = 0
    while (idx < s.length) {
        const h = s[idx]
        const f = target[h]
        let c = cur[h]
        if (c === undefined) c = 0
        if (!f) {
            cur = {}
            start = idx+1
            idx = start
        } else if (c < f) {
            cur[h] = c+1
            idx++
            if (is_same(target, cur)) {
                res.push(start)
                cur[s[start]]--
                start++
            }
        } else { // c === f
            let x = start;
            for (x = start; s[x]!==h; x++) {
                cur[s[x]]--
            }
            start = x+1
            idx++
        }
    }
    return res
};

function is_same(target, cur) {
    for (let k of Object.keys(target)) {
        if (target[k] !== cur[k]) return false
    }
    return true
}
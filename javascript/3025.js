var numberOfPairs = function(points) {
    const len = points.length
    let cnt = 0
    points.sort(([a,b], [c,d]) => {
        if (a === c) return d-b
        return a-c
    })
    for (let i = 0; i < len-1; i++) {
        const [a,b] = points[i]
        for (let j = i+1; j < len; j++) {
            const [c,d]  = points[j]
            if (a > c || b < d) continue
            let ok = true
            for (let k = 0; k < len; k++) {
                if (k === i || k === j) continue
                const [e,f] = points[k]
                if (e >= a && e <= c && f <= b && f >= d) {
                    ok = false
                }
            }
            if (ok) cnt++
        }
    }
    return cnt
};
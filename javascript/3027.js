var numberOfPairs = function(points) {
    const len = points.length
    let cnt = 0
    points.sort(([a,b], [c,d]) => {
        if (a === c) return d-b
        return a-c
    })
    for (let i = 0; i < len-1; i++) {
        const [a,b] = points[i]

        // we already know that c <= a
        // find first point such that d <= b
        let j = i+1
        let c, d
        while(j < len) {
            [c,d] = points[j]
            if (d <= b) break
            j++
        }
        if (j === len) continue
        cnt++
        
        // mow count the number of all points
        // such that f > d
        for (let k = j+1; k < len; k++) {
            const [e,f] = points[k]
            // e < c impossible!
            if (e === c) continue
            if (f < d) continue
            if (f > b) continue
            if (f === d) continue
            c = e
            d = f
            cnt++
        }
    }
    return cnt
};
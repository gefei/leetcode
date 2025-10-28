var merge = function(intervals) {
    intervals.sort((a,b) => {return a[0] - b[0]})
    let res = []
    let current = intervals[0]
    for (let i = 1; i < intervals.length; i++) {
        if (current[1] >= intervals[i][0]) {
            current[1] = Math.max(intervals[i][1], current[1])
        } else {
            res.push(current)
            current = intervals[i]
        }
    }
    res.push(current)
    return res
};
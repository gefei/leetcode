var canReach = function(arr, start) {
    const visited = new Set([start])
    const queue = [start]
    while (queue.length !== 0) {
        const cur = queue.shift()
        if (arr[cur] === 0) return true
        visited.add(cur)
        const [left, right] = [cur-arr[cur], cur+arr[cur]]
        if (left >= 0 && !visited.has(left)) queue.push(left)
        if (right < arr.length && !visited.has(right)) queue.push(right)
    }
    return false
};
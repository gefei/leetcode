var canReach = function(arr, start) {
    const visited = new Set()
    function rec(n) {
        if (arr[n] === 0)  return true
        visited.add(n)
        const [left, right] = [n-arr[n], n+arr[n]]
        if (left >= 0 && !visited.has(left)) {
            const result = rec(left)
            if (result) return true
        }
        if (right < arr.length && !visited.has(right)) {
            const result = rec(right)
            if (result) return true
        }
        return false
    }
    return rec(start)
};
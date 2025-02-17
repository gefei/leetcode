var constructDistancedSequence = function(n) {
    let res = []
    function dfs(pos, nums, len, acc) {
        if (pos === 2*len -1) {
            found = true
            for (let i in Object.keys(acc)) {
                res[i] = acc[i]
            }
        }
        if (found) return acc
        if (acc[pos] !== undefined) {
            return dfs(pos+1, nums, len, acc)
        }
        for (let i in nums) {
            if (found) break
            const n = nums[i]
            if (n === 1) {
                let n_obj = {}
                Object.assign(n_obj, acc)
                n_obj[+pos] = 1
                dfs(pos+1, [...nums.slice(0, +i), ...nums.slice(+i+1)], len, n_obj)
            } else if (pos+n < 2*len-1 && acc[pos+n] === undefined) {
                let n_obj = {}
                Object.assign(n_obj, acc)
                n_obj[+pos] = n_obj[+pos+n] = n
                dfs(pos+1, [...nums.slice(0, +i), ...nums.slice(+i+1)], len, n_obj)
            } 
        }
        return res
    }
    let found = false
    return dfs(0, [...Array(n).keys()].map(x => n-x), n, {})
};
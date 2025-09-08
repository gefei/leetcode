var subarraySum = function(nums, k) {
    const len = nums.length
    const map = {}
    let cnt = 0
    let s = 0
    for (let i = 0; i < len; i++) {
        s = s + nums[i]
        if (s === k) {
            cnt++
        } 
        const t = s - k
        if (map[t]) {
            cnt += map[t]
        } 
        let x = map[s]
        if (!x) x = 0
        map[s] = x+1
    }
    return cnt
};
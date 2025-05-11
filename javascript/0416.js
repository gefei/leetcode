var canPartition = function(nums) {
    const s = nums.reduce((a,b) => a+b)
    if (s&1) return false
    const target = s >> 1
    const mx = Math.max(...nums)
    if (mx > target) return false
    if (mx === target) return true
    let a = Array(target+1)
    a[0] = true
    for (let i = 1; i <= target; i++) {
        a[i] = false
    }
    a[nums[0]] = true
    for (let i = 1; i < nums.length; i++) {
        let b = Array(target+1)
        for (let j = 0; j <= target; j++) {
            b[j] = a[j]
        }
        for (let j = nums[i]; j <= target; j++) {
            b[j] = b[j] | a[j-nums[i]]
        }
        if (b[target]) return true
        a = b
    }
    return false
};
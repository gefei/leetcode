var partitionDisjoint = function(nums) {
    const len = nums.length
    const max = {0: nums[0]}
    for (let i = 1; i < len; i++) {
        max[i] = Math.max(max[i-1], nums[i])
    }
    const min = {}
    min[len-1] = nums[len-1]
    for (let i = len-2; i >= 0; i--) {
        min[i] = Math.min(min[i+1], nums[i])
    }
    i = 0
    while (max[i] > min[i+1]) {
        i++
    }
    return i+1
};
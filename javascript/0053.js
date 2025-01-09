var maxSubArray = function(nums) {
    const res = [nums[0]]
    for (let i = 1; i < nums.length; i++) {
        if (res[i-1] < 0) {
            res[i] = nums[i]
        } else {
            res[i] = nums[i] + res[i-1]
        }
    }
    return Math.max.apply(null, res)
};
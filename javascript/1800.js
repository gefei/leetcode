var maxAscendingSum = function(nums) {
    if (nums.length === 1) return nums[0]
    let i = 1
    let cur_sum = mx_sum = nums[0]
    while (i < nums.length) {
        if (nums[i-1] < nums[i]) {
            cur_sum = cur_sum + nums[i]
        } else {
            mx_sum = Math.max(mx_sum, cur_sum)
            cur_sum = nums[i]
        }
        i++
    }
    return Math.max(mx_sum, cur_sum)
};
var canJump = function(nums) {
    let record = {}
    let i = 0
    let limit = 0
    while (i <= limit) {
        record[i] = true
        limit = Math.max(limit, i + nums[i])
        i++
    }
    return (!!record[nums.length-1])
};
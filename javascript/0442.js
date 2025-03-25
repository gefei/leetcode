var findDuplicates = function(nums) {
    const res = []
    for (let i = 0; i < nums.length; i++) {
        let x = nums[i]
        if (x < 0) x = -x
        x = x - 1
        if (nums[x] < 0) {
            res.push(x+1)
        } else {
            nums[x] = -nums[x]
        }
    }
    return res
};
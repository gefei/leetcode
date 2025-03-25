var findDuplicate = function(nums) {
    for (let i = 0; i < nums.length; i++) {
        let x = nums[i]
        if (x<0) x = -x
        if (nums[x-1] < 0) return x
        nums[x-1] = -nums[x-1]
    }
};
var findDisappearedNumbers = function(nums) {
    const res = []
    for (let i = 0; i < nums.length; i++) {
        let x = nums[i]
        if (x < 0) x = -x
        x = x - 1
        if (nums[x] > 0) nums[x] = -nums[x]
    }
    console.log('a', nums)
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] > 0) res.push(i+1)
    }
    return res
};
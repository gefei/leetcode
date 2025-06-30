var rearrangeArray = function(nums) {
    const len = nums.length
    if (len === 1) return nums
    nums.sort((a,b) => a-b)
    const mid = (len >> 1)
    let a = mid - ((len&1)?0:1), b = len-1
    const res = []
    while (a >= 0) {
        res.push(nums[a--])
        res.push(nums[b--])
    }
    for (let i = 0; i < len; i++) {
        nums[i] = res[i]
    }
    return nums
};
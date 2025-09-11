var subarraySum = function(nums, k) {
    const len = nums.length
    let cnt = 0
    for (let i = 0; i < len; i++) {
        let s = 0
        for (let j = i; j < len; j++) {
            s = s + nums[j]
            if (s === k) cnt++
        }
    }
    return cnt
};
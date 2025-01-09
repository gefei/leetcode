var maxSubArray = function(nums) {
    let s = 0
    let m = nums[0]
    let i = 0
    while (i < nums.length) {
        s += nums[i]
        if (m < s) {
            m = Math.max(s, nums[i])
        }
        if (s < 0) {
            s = 0
        }
        i++
    }
    return m
};

console.log(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
console.log(maxSubArray([1]))
console.log(maxSubArray([5,4,-1,7,8]))
console.log(maxSubArray([-1]))
console.log(maxSubArray([-3,-1]))
console.log(maxSubArray([-3,2,-1]))
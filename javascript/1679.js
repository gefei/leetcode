var maxOperations = function(nums, k) {
    nums.sort((a,b) => a-b)
    const len = nums.length
    let c = 0
    let a = 0
    let b = nums.length-1
    while (a < b) {
        if (nums[a] + nums[b] === k) {
            a++
            b--
            c++
        } else if (nums[a] + nums[b] < k) {
            a++
        } else {
            b--
        }
    }
    return c
};
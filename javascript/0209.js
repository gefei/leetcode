var minSubArrayLen = function(target, nums) {
    let a = 0, b = 0
    let s = 0
    let mn = nums.length
    let found = false
    while (b < nums.length) {
        while (b < nums.length && s < target) {
            s = s + nums[b]
            b = b + 1
        }
        while (s >= target) {
            found = true
            if (mn > b - a) {
                mn = b - a
            }
            s = s - nums[a]
            a = a + 1
        }
    }
    return (found) ? mn : 0
};
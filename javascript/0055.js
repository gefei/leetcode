var canJump = function(nums) {
    let max = 0
    let pos = 0
    while (pos <= max) {
        max = Math.max(pos +nums[pos], max)
        if (max >= nums.length - 1) {
            return true
        }
        pos = pos + 1
    }
    return false
};

nums = [2,3,1,1,4]
console.log(canJump(nums))
nums = [3,2,1,0,4]
console.log(canJump(nums))
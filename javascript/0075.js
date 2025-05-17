var sortColors = function(nums) {
    const count = [0, 0, 0]
    for (let n of nums) {
        count[n]++
    }
    for (let i = 0; i < count[0]; i++) {
        nums[i] = 0
    }
    for (let i = count[0]; i < count[0] + count[1]; i++) {
        nums[i] = 1
    }
    for (let i = count[0] + count[1]; i < nums.length; i++) {
        nums[i] = 2
    }
    return nums 
};
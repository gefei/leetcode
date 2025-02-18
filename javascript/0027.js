var removeElement = function(nums, val) {
    let i = 0
    let j = 0
    const len = nums.length
    let c = 0
    while (j < len) {
        while (j < len && nums[j] === val)  {
            j++
        }
        if (j < len) {
            c++;
        }
        nums[i] = nums[j]
        i++
        j++
    }
    return c
};
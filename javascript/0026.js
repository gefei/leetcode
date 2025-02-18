var removeDuplicates = function(nums) {
    let i = 0
    let j = 0
    const len = nums.length
    while (j < len) {
        const c = nums[j]
        while (j < len && nums[j] === c)  {
            j++
        }
        i++
        nums[i] = nums[j]
    }
    return i
};
var moveZeroes = function(nums) {
    const len = nums.length
    let [i, j] = [0, 0]
    let c = 0
    while (j < len) {
        while (j < len && nums[j] === 0) {
            j++
            c++
        }
        nums[i] = nums[j]
        i++
        j++
    }
    for (let i = 0; i < c; i++) {
        nums[len-i-1] = 0
    }
};
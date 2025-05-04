var threeSum = function(nums) {
    nums.sort((a,b) => a-b)
    const len = nums.length
    const res = []
    let i = 0
    while (i < len-2) {
        while (i > 0 && nums[i]===nums[i-1]) {
            i++
        }
        let j = i + 1, k = len-1
        while (j < k) {
            const s = nums[i]+nums[j]+nums[k]
            if (s === 0) {
                res.push([nums[i], nums[j], nums[k]])
                j++
                while (j < k && nums[j] === nums[j-1]) j++
            } else if (s < 0) {
                j++
            } else {
                k--
            }
        }
        i++
    }
    return res
};
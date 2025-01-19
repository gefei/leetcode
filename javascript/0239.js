var maxSlidingWindow = function(nums, k) {
    const res = []
    let max = nums[0]
    let max_pos = -1
    let right = k-1
    let i = 0
    while (i <= nums.length-k) {
        if (i > max_pos) {
            max = nums[i]
            for (let j = i+1; j <= i+k-1 && j <nums.length; j++) {
                if (nums[j] >= max) {
                    max = nums[j]
                    max_pos = j
                }
            }
        } else {
            if (i+k-1 < nums.length && nums[i+k-1] > max) {
                max = nums[i+k-1]
                max_pos = i+k-1
            }
        }
        res.push(max)
        i++
    }
    console.log(res)
}

console.log(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
console.log(maxSlidingWindow([1], 1))
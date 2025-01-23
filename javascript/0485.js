var findMaxConsecutiveOnes = function(nums) {
    let m = 0
    let count = 0
    for (let i = 0; i < nums.length; i++) {
        if (nums[i]) {
            count++
            if (count > m) m = count
        } else {
            count = 0
        }
    }
    return m
};

console.log(findMaxConsecutiveOnes([1,1,0,1,1,1]))
console.log(findMaxConsecutiveOnes([1,0,1,1,0,1]))
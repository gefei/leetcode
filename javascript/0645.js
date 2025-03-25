var findErrorNums = function(nums) {
    const s = nums.reduce((a,b) => a+b)
    const len = nums.length;
    let rep
    for (let i = 0; i < len; i++) {
        let x = nums[i]
        if (x < 0) x = -x
        if (nums[x-1] < 0) {
            rep = x
            break
        }
        nums[x-1] = -nums[x-1]
    }
    return [rep, len*(len+1)/2 + rep-s]
};
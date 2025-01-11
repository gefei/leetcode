var jump = function(nums) {
    let record = {0: 0}
    let i = 0
    let limit = 0
    while (i <= limit) {
        let new_limit = Math.max(limit, nums[i] + i)
        if (new_limit > limit) {
            for (let j = limit+1; j <= new_limit; j++) {
                record[j] = (record[j]) ? Math.min(record[j], record[i] + 1) : record[i] + 1
            }
            limit = new_limit
        }
        i++
    }
    return (record[nums.length-1])
};

console.log(jump([2,3,1,1,4]))
console.log(jump([2,3,0,1,4]))
var missingNumber = function(nums) {
    let s = (nums.length * (nums.length+1))/2
    for (let n of nums) {
        s = s - n
    }
    return s
};
console.log(missingNumber([3,0,1]))
console.log(missingNumber([0,1]))
console.log(missingNumber([9,6,4,2,3,5,7,0,1]))
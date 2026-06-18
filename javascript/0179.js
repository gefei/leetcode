var largestNumber = function(nums) {
    nums.sort((a,b) => {
        if (Number(String(a)+String(b)) <= Number(String(b)+String(a))) {return 1} else {return -1}
    })
    s = nums.join('')
    if (+s === 0) return '0'
    return s
};

console.log(largestNumber([10,2]))
console.log(largestNumber([3,30,34,5,9]))
var divideArray = function(nums) {
    const res = []
    for (let n of nums) {
        res[n] = !res[n]
    }
    for (let b of res) {
        if (b) return false
    }
    return true
};

console.log(divideArray([3,2,3,2,2,2]))
console.log(divideArray([1,2,3,4]))
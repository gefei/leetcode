var ProductOfNumbers = function() {
    this.nums = []
};

ProductOfNumbers.prototype.add = function(num) {
    this.nums.push(num)
};

ProductOfNumbers.prototype.getProduct = function(k) {
    let s = 1
    let l = this.nums.length
    for (let i = 0; i < k; i++) {
        s = s * this.nums[l-i-1]
    }
    return s
};
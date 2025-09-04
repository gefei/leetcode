var Solution = function(nums) {
    this.nums = nums
    this.copy = [...this.nums]
};

/**
 * @return {number[]}
 */
Solution.prototype.reset = function() {
    this.copy = [...(this.nums)]
    return this.copy
};

/**
 * @return {number[]}
 */
Solution.prototype.shuffle = function() {
    let n = this.copy.length-1
    for (let i = 0; i < this.copy.length; i++) {
        const idx = Math.floor(Math.random() * (n+1))
        const t = this.copy[idx]
        this.copy[idx] = this.copy[n]
        this.copy[n] = t
        n = n - 1
    }
    return this.copy
};
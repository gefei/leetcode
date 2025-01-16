var ArrayWrapper = function(nums) {
    this.value = nums
};

/**
 * @return {number}
 */
ArrayWrapper.prototype.valueOf = function() {
    let s = 0;
    for (n of this.value) {
        s = s + n
    }
    return s
}

/**
 * @return {string}
 */
ArrayWrapper.prototype.toString = function() {
    return `[${this.value.toString()}]`
}

const obj1 = new ArrayWrapper([1,2]);
const obj2 = new ArrayWrapper([3,4]);
console.log(obj1 + obj2); // 10
console.log(String(obj1)); // "[1,2]"
console.log(String(obj2)); // "[3,4]"
 
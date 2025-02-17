var DataStream = function(value, k) {
    this.value = value
    this.k = k
    this.count = 0
};

DataStream.prototype.consec = function(num) {
    if (num === this.value) {
        this.count++
    } else {
        this.count = 0
    }
    if (this.count === this.k) {
        this.count--
        return true
    }
    return false
};
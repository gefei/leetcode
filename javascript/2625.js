var flat = function (arr, n) {
    while (n > 0) {
        const next = []
        let has_array = false
        for (let a of arr) {
            if (typeof(a) !== 'object') {
                next.push(a)
            } else {
                has_array = true
                for (let b of a) {
                    next.push(b)
                }
            }
        }
        if (!has_array) return arr
        n--
        arr = next
    }
    return arr
};

console.log(flat([1, 2, 3, [4, 5, 6], [7, 8, [9, 10, 11], 12], [13, 14, 15]], 1))
console.log(flat([[1, 2, 3], [4, 5, 6], [7, 8, [9, 10, 11], 12], [13, 14, 15]], 2))
var makeIntegerBeautiful = function(n, target) {
    function is_beautiful(n, target) {
        let s = 0
        while (n > 0) {
            s = s + n % 10
            n = parseInt(n / 10)
        }
        return s <= target
    }
    const s = n.toString()
    let t = 0
    let i = 0
    while(i < s.length) {
        t = t + +s[i]
        if (t > target) break;
        i++
    }
    if (i === s.length) {return 0}
    for (let j = i; j >= 0; j--) {
        let prefix = +(s.substring(0, j)) + 1
        for (let k=j; k<s.length; k++) {
            prefix = prefix + '0'
        }
        if (is_beautiful(prefix, target)) {
            return prefix-n
        }
    }
};

console.log(makeIntegerBeautiful(16, 6))
console.log(makeIntegerBeautiful(467, 6))
console.log(makeIntegerBeautiful(1, 1))
console.log(makeIntegerBeautiful(12, 3))
console.log(makeIntegerBeautiful(120, 3))
console.log(makeIntegerBeautiful(199, 1))
console.log(makeIntegerBeautiful(199, 2))
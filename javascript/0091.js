var numDecodings = function(s) {
    if (s[0] === '0') { return 0 }
    const res = {0:1, 1:1}
    for (let i = 2; i <= s.length; i++) {
        if (s[i-1] === '0') {
            if (s[i-2] === '0') return 0
            if (s.substring(i-2, i) <= 26) {
                res[i] = res[i-2]
            } else {
                return 0
            }
        } else if (s[i-2] === '0') {
            res[i] = res[i-1]
        } else  {
            if (s.substring(i-2, i) <= 26) {
                res[i] = res[i-1] + res[i-2]
            } else {
                res[i] = res[i-1]
            }
        }
    }
    return res[s.length]
}

console.log(numDecodings("10"))
console.log(numDecodings("12"))
console.log(numDecodings("226"))
console.log(numDecodings("06"))
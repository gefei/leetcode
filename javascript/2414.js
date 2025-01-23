var longestContinuousSubstring = function(s) {
    let mx = 0
    let i = 0
    while (i < s.length) {
        let count = 1
        let j = i + 1 
        while (j < s.length && s[j].charCodeAt(0) === 1 + s[j-1].charCodeAt(0)) {
            j++
            count++
        }
        mx = Math.max(mx, count)
        i = j
    }
    return mx
};

console.log(longestContinuousSubstring('abacaba'))
console.log(longestContinuousSubstring('abcde'))
console.log(longestContinuousSubstring('pcfftiovoygwwncfgews'))
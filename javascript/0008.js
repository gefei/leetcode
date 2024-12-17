var myAtoi = function(s) {
    let pos = 0
    let sign = 1
    let sum = 0
    const two_31 = 2**31
    function process() {
        for (let c of s) {
            while (s[pos] === ' ') {
                pos++
            }
            let c = s[pos]
            if (c === '+') {
                pos++
            } else if (c === '-') {
                pos++;
                sign = -1
            }
            c = s[pos]
            while (!isNaN(c) && c !== ' ') {
                sum = sum * 10 + (+c)
                if (sum >= two_31 && sign === 1) return two_31-1;
                if (sum > two_31 && sign === -1) return -two_31;
                pos++
                c = s[pos]
            }
            return sign * sum
    }

    return process()
}

console.log(myAtoi(" -2147483649"))
console.log(myAtoi(" 2147483648"))
console.log(myAtoi(" 4836 w"))

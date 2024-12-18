var isNumber = function(s) {
    function is_digit(c) {
        return c >= '0' && c <= '9'
    }
    let state = 1;
    let has_num = false;
    for (let c of s) {
        if (state === 1) {
            if (c === '+' || c === '-') {
                state = 2
            } else if (is_digit(c)) {
                state = 21
            } else if (c === '.') {
                state = 3
            } else {
                return false
            }
        } else if (state === 2) {
            if (is_digit(c)) {
                has_num = true
                state = 21
            } else if (c === '.') {
                state = 3
            } else {
                return false
            }
        } else if (state === 21) {
            if (is_digit(c)) {
                has_num = true
                state = 21
            } else if (c === '.') {
                state = 31
            } else if (c === 'e' || c === 'E') {
                state = 4
            } else {
                return false
            }
        } else if (state === 3) {
            if (is_digit(c)) {
                state = 31
            } else {
                return false
            }
        } else if (state === 31) {
            if (is_digit(c)) {
                state = 31
            } else if (c === 'e' || c === 'E') {
                state = 4
            } else {
                return false
            }
        } else if (state === 4) {
            if (c === '+' || c === '-') {
                state = 5
            }
            else if (is_digit(c)) {
                state = 51
            } else {
                return false
            }
        } else if (state === 5) {
            if (is_digit(c)) {
                state = 51
            } else {
                return false
            }
        } else if (state === 51) {
            if (is_digit(c)) {
                state = 51
            } else {
                return false
            }
        }
    }
    return (state === 21 && has_num) || state === 31 || state === 51 || state === 21
};

const yes = ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"]
const no  = ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53", "."]

// console.log(isNumber("2e10"))

for (let y of yes) {
    console.assert(isNumber(y), y)
}
for (let n of no) {
    console.assert(!isNumber(n))
}
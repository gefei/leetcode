var fractionToDecimal = function(numerator, denominator) {
    let negative = numerator < 0 
    if (numerator === 0) return '0'
    if (denominator < 0) negative = !negative
    if (numerator < 0) numerator = -numerator
    if (denominator < 0) denominator = -denominator
    const rest_map = {}
    let s 
    let rest = numerator % denominator
    let q = (numerator - rest) / denominator
    s = q + '.' 
    const zero_is = s.length;
    let i = 0
    while (rest !== 0) {
        rest_map[rest] = i
        numerator = rest * 10
        rest = numerator % denominator
        q = (numerator - rest) / denominator
        if (rest_map[rest] !== undefined) {
            const left = rest_map[rest]
            s = s.slice(0, zero_is+left) + '(' + s.slice(zero_is+left) + q + ')'
            break
        }
        s = s + q
        i++
    }
    if (s[s.length-1] === '.') s = s.slice(0, s.length-1)
    if (negative) return '-'+s
    else return s
};
/**
 * @param {string} a
 * @param {string} b
 * @return {string}
 */

var addBinary = function(a, b) {
    if (a.length < b.length) {
        [a, b] = [b, a]
    }
    const diff = a.length - b.length; 
    for (let i = 0; i < diff; i++) {
        b = '0' + b
    }
    let c = 0
    let result = ''
    for (let pos = a.length-1; pos >= 0; pos--) {
        let s = +a[pos] + +b[pos] + c
        let r = s % 2
        c = (s>1)?1:0
        result = r + result
    }
    if (c === 1) {
        result = 1 + result
    }
    return result

};

console.log(addBinary("10000", "10000"))
console.log(addBinary("1010", "1011"))
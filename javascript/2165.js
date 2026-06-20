var smallestNumber = function(num) {
    if (num === 0) return 0;
    const histo = []
    for (let i = 0; i <= 9; i++) {histo[i] = 0}
    const s = String(num)
    for (const c of s) {
        if (c !== '-') histo[c]++
    }
    if (num > 0) {
        let mn = 9
        for (let i = 1; i < 10; i++) {
            if (histo[i] !== 0 && mn >= i) {
                mn = i
            }
        }
        let res = mn
        for (let i = 0; i < 10; i++) {
            let cnt = histo[i]
            if (mn === i) cnt--
            for (let j = 0; j < cnt; j++) {
                res = res * 10 + i
            }
        }
        return res
    }
    if (num < 0) {
        let mn = 0
        for (let i = 1; i < 10; i++) {
            if (histo[i] !== 0 && mn <= i) {
                mn = i
            }
        }
        let res = mn
        for (let i = 9; i >= 0; i--) {
            let cnt = histo[i]
            if (mn === i) cnt--
            for (let j = 0; j < cnt; j++) {
                res = res * 10 + i
            }
        }
        return -res;
    }
};

console.log(smallestNumber(310))
console.log(smallestNumber(7605))
console.log(smallestNumber(7604055))
console.log(smallestNumber(-7605))
console.log(smallestNumber(-76605505))
var shiftingLetters = function(s, shifts) {
    const a = 'a'.charCodeAt(0)
    shifts = shifts.map(x => x % 26)
    let sum = 0
    const prefix = Array(shifts.length)
    for (let i = shifts.length-1; i >= 0; i--) {
        sum = (sum + shifts[i]) % 26
        prefix[i] = sum
    }
    let res = ''
    for (let i = 0; i < shifts.length; i++) {
        const y = s.charCodeAt(i)
        const p = prefix[i]
        const x = (y - a + p)  % 26
        const code = x + a
        res = res + (String.fromCodePoint(code))
    }
    return res
};
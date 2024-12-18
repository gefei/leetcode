var checkString = function(s) {
    const b = s.indexOf('b')
    const a = s.lastIndexOf('a')
    return a === -1 || b === -1 || a < b
};

const yes = ["aaabbb"]
const no  = ["abab"]

for (let s of yes) {
    console.assert(checkString(s))
}
for (let s of no) {
    console.assert(!checkString(s))
}
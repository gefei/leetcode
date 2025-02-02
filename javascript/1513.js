var numSub = function(s) {
    const regexp = /1+/g;
    const array = [...s.matchAll(regexp)];
    let sm = 0
    for (let match of array) {
        sm = sm + match[0].length * (match[0].length+1) / 2
    }
    return sm % 1000000007
};

console.log(numSub("0110111"))
console.log(numSub("101"))
console.log(numSub("111111"))




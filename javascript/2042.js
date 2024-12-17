var areNumbersAscending = function(s) {
    const re = /\d+/g
    let current = 0
    let match = re.exec(s)
    while (match != null) {
        let next = +(match[0])
        if (next <= current) {
            return false
        }
        current = next
        match = re.exec(s)
    }
    return true
};

console.log(areNumbersAscending("1 box has 3 blue 4 red 6 green and 12 yellow marbles"))
console.log(areNumbersAscending("hello world 5 x 5"))
console.log(areNumbersAscending("sunset is at 7 51 pm overnight lows will be in the low 50 and 60 s"))
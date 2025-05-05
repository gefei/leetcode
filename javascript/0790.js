var numTilings = function(n) {
    if (n === 1) return 1
    if (n === 2) return 2
    let a = 1, b = 2
    let sum = 1  // f(0) = 1
    let d
    for (let i = 3; i <= n; i++) {
        d = (a + b + 2*sum) % (1e9 + 7)
        sum += a
        a = b
        b = d
    }
    return d % (1e+9 + 7)
};
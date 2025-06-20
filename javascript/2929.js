var distributeCandies = function(n, limit) {
    if (n > limit*3) return 0
    let min_a = n - (limit << 1)
    if (min_a < 0) min_a = 0
    let max_a = n
    if (max_a > limit) max_a = limit
    let c = 0
    for (let i = min_a; i <= max_a; i++) {
        let min_b = n-i-limit
        if (min_b < 0) min_b = 0
        let max_b = n-i
        if (max_b > limit) max_b = limit
        c = c + max_b - min_b + 1
    }
    return c
};
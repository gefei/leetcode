var commonFactors = function(a, b) {
    function get_prime_factors(n) {
        let candi = 2
        let res = new Map()
        let c = 0
        while (n % candi === 0) {
            n = n / candi
            c = c + 1
        }
        if (c > 0) res.set(candi, c)
        candi = 3
        while (candi <= n) {
            c = 0
            while (n % candi === 0) {
                n = n / candi
                c = c + 1
            }
            if (c > 0) res.set(candi, c)
            candi = candi + 2
        }
        return res
    }
    let res = 1
    let [fac_a, fac_b] = [get_prime_factors(a), get_prime_factors(b)]
    for (let [key, n1] of fac_a) {
        if (fac_b.has(key)) {
            const m = Math.min(n1, fac_b.get(key)) + 1
            res = res * m
        }
    }
    return res
};

console.log(commonFactors(12, 6))
console.log(commonFactors(25, 30))
console.log(commonFactors(32, 408))
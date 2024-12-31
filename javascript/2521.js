var distinctPrimeFactors = function(nums) {
    function get_prime_factors(n) {
        let candi = 2
        let res = new Set()
        while (n % candi === 0) {
            res.add(candi)
            n = n / candi
        }
        candi = 3
        while (candi <= n) {
            while (n % candi === 0) {
                res.add(candi)
                n = n / candi
            }
            candi = candi + 2
        }
        return res
    }
    function union(a, b) {
        for (x of b) {
            if (!a.has(x)) a.add(x)
        }
    }
    let res = new Set()
    for (n of nums) {
        union(res, get_prime_factors(n))
    }
    return res.size
};



console.log(distinctPrimeFactors([2,4,3,7,10,6]))
console.log(distinctPrimeFactors([2,4,8,16]))
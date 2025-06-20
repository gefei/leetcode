var distributeCandies = function(n, limit) {
    let a = []
    for (let i = 0; i <= n; i++) {
        if (i <= limit) {
            a.push(1)
        } else {
            a.push(0)
        }
    }
    for (let k = 2; k <= 3; k++) {
        let b = []
        for (let i = 0; i <= n; i++) {
            let c = 0
            for (let p = 0; p <= limit && p <= i; p++) {
                c = c + a[i-p]
            }
            b.push(c)
        }
        a = b
    }
    return a[a.length-1]
};

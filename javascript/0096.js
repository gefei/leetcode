var numTrees = function(n) {
    const res = {0:1, 1:1}  
    for (let i = 2; i <= n; i++) {
        res[i] = 0
        for (let j = 0; j <= i>>1; j++) {
            const k = i - j - 1
            if (j > k) break
            if (j === k) res[i] = res[i] + res[j] * res[k];
            else         res[i] = res[i] + res[j] * res[k] * 2;
        }
    }
    return res[n]
};
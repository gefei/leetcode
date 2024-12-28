const fs = require('node:fs');

var minSteps = function(n) {
    function update_1(){
        result[1] = 0
        result[2] = 2
        for (let a = 3; a<=n; a++) {
            result[a] = result[a-1] + 1
        }
    }
    function update_self(i) {
        if (i+i > n) return;
        if (result[i+i] > result[i]+2) {
            result[i+i] = result[i]+2
            let factor = 3
            for (let a = factor*i; a <= n; a+=i) {
                if (result[a] > result[i] + factor) {
                    result[a] = result[i] + factor
                }
                factor++
            }
        }
    }

    let result = {
        1: 0,
    }
    update_1()
    for (let i = 2; i <= n; i++) {
        update_self(i)
    }
    return result[n]
};

console.log(minSteps(247))
console.log(minSteps(741))
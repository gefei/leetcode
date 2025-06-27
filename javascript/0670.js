var maximumSwap = function(num) {
    if (num < 10) return num
    const d = num.toString()
    return +rec(d, '')
};

function rec(d, prefix) {
    if (d.length === 0) return prefix
    let mx = -1
    for (let c of d) {
        if (mx < c) mx = c
    }
    let i = 0
    while (i < d.length) {
        if (d[i] != mx) break
        i++
    }
    if (i > 0) {
        const new_p = d.substr(0, i)
        return rec(d.substr(i), prefix + new_p)
    } 
    let j = d.length-1
    while (d[j] !== mx) {
        j--
    }
    return prefix + mx + d.substr(1, j-1) + d[0] + d.substr(j+1)
}

console.log(maximumSwap(2736))
console.log(maximumSwap(9973))
console.log(maximumSwap(98368))
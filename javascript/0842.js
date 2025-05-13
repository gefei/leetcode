var splitIntoFibonacci = function(num) {
    const len = num.length
    const a_hi = (num[0] === 0) ? 1 : (len>>1)+1
    for (let a=1; a<a_hi; a++) {
        const a_num = +num.slice(0, a)
        const b_hi = (num[a] === 0) ? a+1 : a+((len-a)>>1) + 1
        for (let b=a+1; b<=b_hi; b++) {
            if (b >= len-1) break
            const b_num = +num.slice(a, b)
            const {res, arr} = get_array(a_num, b_num, b, num)
            if (res) return [a_num, b_num, ...arr]
        }
    }
    return []
};

function get_array(a_num, b_num, b, num) {
    const arr = []
    const len = num.length
    const limit = 2**31
    while (b < len) {
        const c_num = a_num + b_num
        if (c_num >= limit) return {res: false, arr: []}
        const c_str = (c_num+'')
        const c_len = c_str.length
        if (c_str !== num.slice(b, b+c_len)) return {res: false, arr: []}
        arr.push(c_num)
        a_num = b_num
        b_num = c_num
        b = b + c_len
    }
    return {res: true, arr: arr}
}
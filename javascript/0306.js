var isAdditiveNumber = function(num) {
    const len = num.length
    const a_len = (num[0]==='0') ? 1 : len>>1 
    let a = 1
    while (a <= a_len) {
        const b_len = (num[a]!=='0') ? (len-a)>>1 : 1
        let a_num = +(num.substring(0, a))
        for (let b=1; b <= b_len; b++) {
            let b_num = +(num.substring(a, a+b))
            if (is_ok(a_num, b_num, a+b, num)) return true
        }
        a++
    }
    return false
};

function is_ok(a, b, start, num) {
    if (start >= num.length) return false
    while (start < num.length) {
        let c = (a+b)
        let c_s = c+''
        let l = c_s.length
        if (c_s !== num.slice(start, start+l)) return false
        start += l
        a = b
        b = c
    }
    return true
}
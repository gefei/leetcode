var compress = function(chars) {
    if (chars.length === 1) return 1
    let res = ''
    let i = 0
    let len = 0
    while (i < chars.length) {
        if (i === chars.length-1) {
            res = res + chars[i]
            len++
            break
        }
        let j = i + 1
        while (j < chars.length && chars[j] == chars[i]) {
            j++
        }
        if (j > i+1) {
            const s = String(j-i)
            res = res + chars[i] + (j-i)
            i = j
            len += 1 + s.length
        } else {
            res = res + chars[i]
            len++
            i++
        }
    };
    Object.assign(chars, res)
    return len
}
var robotWithString = function(s) {
   return step(s, [], 0, '')
};

function step(s, stack, len, cur) {
    if (s.length === 0) {
        for (let i = len; i > 0; i--) {
            cur = cur + stack[i-1]
        }
        return cur
    }
    const mn = get_min(s)
    const last = s.lastIndexOf(mn)
    if (len === 0) {
        let t = ''
        for (let i = 0; i <= last; i++) {
            if (s[i] !== mn) {
                stack[len] = s[i]
                len++
            } else {
                t = t + s[i]
            }
        }
        return step(s.substr(last+1), stack, len, cur+t)
    }
    if (mn < stack[len-1]) {
        let t = ''
        for (let i = 0; i <= last; i++) {
            if (s[i] !== mn) {
                stack[len] = s[i]
                len++
            } else {
                t = t + s[i]
            }
        }
        return step(s.substr(last+1), stack, len, cur+t)
    }
    return step(s, stack, len-1, cur+stack[len-1])
}
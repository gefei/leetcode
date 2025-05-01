var countInterestingSubarrays = function(nums, modulo, k) {
    const len = nums.length
    if (k === 0 && modulo === 1) {
        return len*(len+1)/2
    }
    let res = 0
    const ok = [-1]
    const diff = []
    let last = -1
    for (let i in nums) {
        if (nums[i] % modulo === k ) {
            ok.push(+i)
            diff.push(i-last-1)
            last = +i
        }
    }
    ok.push(len)
    diff.push(len-ok[ok.length-2]-1)
    if (k === 0 && modulo !== 1) {
        res = get_num_zero(ok, diff, 0)
        k = modulo
    }
    for (let num_ok = k; num_ok <= len; num_ok += modulo) {
        res += get_num(ok, diff, num_ok)
    }
    return res 
 };

 function get_num(ok, diff, k) {
    let res = 0
    for (let i = 1; i < ok.length-k; i++) {
        const num_left = diff[i-1]
        const num_right =  diff[i+k-1]
        res = res + num_left + num_right + (num_left*num_right) + 1
    }
    return res
 }

 function get_num_zero(ok, diff, k) {
    let res = 0
    for (let i = 1; i < ok.length; i++) {
        const d = diff[i-1]
        if (d > 0) {
            res += d*(d+1)/2
        }
    }
    return res
 }
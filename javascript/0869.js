var reorderedPowerOf2 = function(n) {
    const nums = n.toString().split('').map(x => +x)
    nums.sort((a,b) => a-b)
    let i = 0;
    for (i = 0; i < nums.length; i++) {
        if (nums[i] > 0) {
            const t = nums[0]
            nums[0] = nums[i]
            nums[i] = t
            break
        }
    }
    const mn = +(nums.join(''))
    nums.sort((a, b) => b-a)
    const mx = +(nums.join(''))

    let x = 1
    while (x <= mx) {
        if (x >= mn) {
            const arr =  x.toString().split('').map(x => +x)
            arr.sort((a, b) => b-a)
            if (arr.every((v, idx) => v === nums[idx])) return true
        }
        x = x + x
    }
    return false
};
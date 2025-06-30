var numSubseq = function(nums, target) {
    nums.sort((a,b) => a-b)
    const M = BigInt(1e9+7)
    let a = 0, b = nums.length-1
    let s = BigInt(0)
    while (a <= b) {
        if (nums[a]+nums[b] <= target) {
            const d = b - a
            const p = BigInt(power_mod(d, M))
            s = BigInt((BigInt(s) + p) % M)
            a++
        } else {
            while (b >= a && nums[a]+nums[b] > target) {
                b--
            }
        }
    }
    return parseInt(s)
};

function power_mod(d, M) {
    if (d === 0) return 1
    if (d === 1) return BigInt(2) % M
    let new_d = d >> 1, r = d & 1
    const t = BigInt(power_mod(new_d, M) % M)
    let res = BigInt((t*t) % M)
    if (r) res = BigInt((res+res) % M)
    return res
}
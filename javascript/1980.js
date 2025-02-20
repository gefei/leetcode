var findDifferentBinaryString = function(nums) {
    const map = {}
    for (let i of nums) {
        map[parseInt(i, 2)] = true
    }
    let i = 0
    while (map[i]) {
        i++
    }
    let prefix = ""
    let ret = i.toString(2)
    for (let i = 0; i < nums.length-ret.length; i++) {
        prefix = "0" + prefix
    }
    return prefix + ret
};
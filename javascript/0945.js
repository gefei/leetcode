var minIncrementForUnique = function(nums) {
    let res = 0
    nums.sort((a,b) => a-b)
    const count = {}
    const nodup = []
    for (let i of nums) {
        if (!count[i]) count[i] = 0
        count[i]++  
        if (count[i] === 1) nodup.push(i)
    }
    const spaces = []
    for (let i = 0; i < nodup.length-1; i++) {
        if (nodup[i+1] - nodup[i] > 1) {
            spaces.push({start: nodup[i]+1, num: nodup[i+1]-nodup[i]-1})
        }
    }
    spaces.push({start: nodup[nodup.length-1]+1, num: nums.length})
    
    let a = 0
    let b = 0
    while (a < nodup.length) {
        const i = nodup[a]
        let cur = spaces[b]
        if (i > cur.start) {
            b++
            continue
        }
        let dup = count[i]-1
        if (dup === 0) {
            a++
            continue
        }
        let num_up = Math.min(dup, cur.num)
        dup = dup - num_up
        count[i] = dup + 1
        cur.num = cur.num - num_up
        if (cur.num === 0) b++
        const d = cur.start - i
        res = res + (d+d+num_up-1)*num_up/2
        cur.start = cur.start + num_up
        if (dup === 0) a++
    }
    

    return res
};

console.log(minIncrementForUnique([1,2,2]))
console.log(minIncrementForUnique([1,1,1,1,3]))
console.log(minIncrementForUnique([3,2,1,2,1,7]))
console.log(minIncrementForUnique([0,2,2]))
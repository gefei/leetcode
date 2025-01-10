var canJump = function(nums) {
    let queue = [0]
    const visited = new Set()
    while (queue.length !== 0) {
        let next = []
        for (let n of queue) {
            if (n === nums.length-1) return true
            visited.add(n)
            for (let  i=Math.min(nums.length-1, n+nums[n]); i >= n+1; i--) {
                if (!visited.has(i)) next.push(i)
            }
        }
        queue = next
    }
    return false
};

nums = [2,3,1,1,4]
console.log(canJump(nums))
nums = [3,2,1,0,4]
console.log(canJump(nums))
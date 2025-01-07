var canReach = function(s, minJump, maxJump) {
    const len = s.length
    if (s[s.length-1] !== '0') return false
    function bfs() {
        const visited = new Set()
        const queue = [0]
        let max = minJump
        while (queue.length !== 0) {
            let pos = queue.shift()
            if (pos + minJump <= len-1 && pos+maxJump >= len-1) {
                return true
            }
            if (visited.has(pos)) continue
            visited.add(pos)
            for (let i = Math.max(pos+minJump, max); i<=pos+maxJump && i<len; i++) {
                if (s[i] === '0' && !visited.has(i)) {
                    queue.push(i)
                }
            }
            max = Math.min(pos+maxJump, len-1)
        }
        return false
    }
    return bfs()
};

s = "011010"
console.log(canReach(s, 2, 3)) 
s = "01101110"
console.log(canReach(s, 2, 3)) 


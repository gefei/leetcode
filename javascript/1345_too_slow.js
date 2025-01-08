var minJumps = function(arr) {
    function bfs(arr, map) {
        const visisted = new Set()
        let queue = [{can: 0, step: 0}]
        while (queue.length !== 0) {
            const {can, step} = queue.shift()
            if (can === arr.length - 1) return step
            if (visisted.has(can)) continue
            visisted.add(can)
            if (can-1 > 0 && !visisted.has(can-1)) {
                queue.push({can: can-1, step: step+1})
            }
            if (can+1 < arr.length && !visisted.has(can+1)) {
                queue.push({can: can+1, step: step+1})
            }
            const map_candis = map[arr[can]]
            if (map_candis) {
                for (const c of map_candis) {
                    if (!visisted.has(c)) {
                        queue.push({can: c, step: step+1})
                    }
                }
                map[arr[can]] = undefined
            }
        }
        return -1
    }
    function main(arr) {
        const map = {}
        for (let i in arr) {
            if (!map[arr[i]]) {
                map[arr[i]] = []
            }
            map[arr[i]].push(+i)
        }
        return bfs(arr, map)
    }
    return main(arr)
};

console.log(minJumps([100,-23,-23,404,100,23,23,23,3,404]))
console.log(minJumps([7]))
console.log(minJumps([7,6,9,6,9,6,9,7]))
console.log(minJumps([7,7,2,1,7,7,7,3,4,1]))
console.log(minJumps([7,7,7,7,7,7,7,7,7,7,7,7,7,11]))
console.log(minJumps([1,2,1,2,1,2,1,2,1,2,1,2,7,11]))


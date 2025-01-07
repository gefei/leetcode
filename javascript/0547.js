var findCircleNum = function(isConnected) {
    function bfs(n) {
        const visited = new Set()
        const queue = [n]
        while(queue.length !== 0) {
            const cur = queue.shift()
            visited.add(cur)
            for (let i = n+1; i < isConnected[cur].length; i++) {
                if (!isConnected[cur][i]) continue
                if (!visited.has(i)) {
                    queue.push(i)
                }
            }
        }
        return visited
    }
    function get_province(n) {
        const visited = new Set()
        function dsf(n) {
            if (!visited.has(n)) visited.add(n)
            for (let i = 0; i < isConnected[n].length; i++) {
                if (isConnected[n][i] && !visited.has(i)) dsf(i)
            }
            return visited
        }
        return dsf(n)
    }
    function main() {
        let c = 0
        let all = new Set()
        for (let i = 0; i < isConnected.length; i++) {
            if (all.has(i)) continue
            //const province = bfs(i)
            const province = get_province(i)
            all = all.union(province)
            c++
        }
        return c
    }
    return main()
};

//isConnected = [[1,1,0],[1,1,0],[0,0,1]]
//console.log(findCircleNum(isConnected))
//isConnected = [[1,0,0],[0,1,0],[0,0,1]]
//console.log(findCircleNum(isConnected))
isConnected = [[1,0,0,1],
               [0,1,1,0],
               [0,1,1,1],
               [1,0,1,1]]
console.log(findCircleNum(isConnected))
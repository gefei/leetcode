var longestConsecutive = function(nums) {
    function find (node) {
        while (id[node] != node) {
            node = id[node]
        }
        return node
    }
    function union(parent, child) {
        let find_parent = find(parent)
        let find_child = find(child)
        if (find_child === find_parent) return
        id[find_child] = id[find_parent]
        sz[find_parent] += sz[find_child]
    }

    const id = {}
    const sz = {}
    for (let n of nums) {
        const t = +n
        id[t] = t
        sz[t] = 1
    }
    for (let n of Object.keys(id)) {
        const t = +n
        if (id[t-1] !== undefined) {
            union(t-1, t)
        }
        if (id[t+1] !== undefined) {
            union(t+1, t)
        }
    }
    let max = 0
    for (let n of Object.keys(id)) {
        if (max < sz[n]) max = sz[n]
    }
    return max
};
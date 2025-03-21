var arrayNesting = function(nums) {
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

    const sz = []
    const id = []
    for (let i in nums) {
        id[i] = +i
        sz[i] = 1
    }
    for (let i in nums) {
        union(+i, nums[i])
    }
    return Math.max(...sz)
};
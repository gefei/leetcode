function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var subtreeWithAllDeepest = function(root) {
    const num_2_node = {}
    get_map(root, num_2_node)
    const p = {}, depth = {}
    set_parent(-1, root, p)
    set_depth(root, 0, depth)
    const mx = get_deeptest_leaves(depth)
    const nodes = get_nodes_with_depth(depth, mx)
    if (nodes.length === 1) {
        return num_2_node[nodes[0]]
    }
    const paths = nodes.map(n => get_path_to_root(n, p))
    let i = paths[0].length-1
    while (true) {
        const nums = paths.map(p => p[i-1])
        if (!same(nums)) {
            return num_2_node[paths[0][i]]
        }
        i--
    }
};

function get_map(n, num_2_node) {
    if (!n) return
    num_2_node[n.val] = n
    get_map(n.left, num_2_node)
    get_map(n.right, num_2_node)
}

function set_parent(from, me, p) {
    if (!me) return
    p[me.val] = from
    set_parent(me.val, me.left, p)
    set_parent(me.val, me.right, p)
}

function set_depth(me, me_d, depth) {
    if (!me) return
    depth[me.val] = me_d
    set_depth(me.left, me_d+1, depth)
    set_depth(me.right, me_d+1, depth)
}

function get_deeptest_leaves(depth) {
    let mx = 0
    for (let i in depth) {
        const d = depth[i]
        if (mx < d) mx = d
    }
    return mx
}

function get_nodes_with_depth(depth, d) {
    const res = []
    for (let i in depth) {
        if (depth[i] == d) {
            res.push(+i)
        }
    }
    return res
}

function get_path_to_root(n, p) {
    let res = []
    while (n !== -1) {
        res.push(n)
        n = p[n]
    }
    return res
}

function same(a) {
    for (let i = 1; i < a.length; i++) {
        if (a[i] !== a[0]) return false
    }
    return true
}
function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var getMinimumDifference = function(root) {
    function get_left_max(root) {
        let node = root.left;
        while (node.right !== null) {
            node = node.right;
        }
        return node;
    }
    function get_right_min(root) {
        let node = root.right;
        while (node.left !== null) {
            node = node.left;
        }
        return node;
    }

    let res = NaN;
    if (root.left === null && root.right === null) return NaN;
    if (root.right !== null) {
        let a1 = get_right_min(root).val - root.val
        const a2 = getMinimumDifference(root.right)
        if (a1 > a2) a1 = a2
        res = a1
    }
    if (root.left !== null) {
        let a1 = root.val - get_left_max(root).val
        const a2 = getMinimumDifference(root.left)
        if (a1 > a2) a1 = a2
        if (isNaN(res)) {res = a1} else {res = Math.min(res, a1)}
    }
    return res
};
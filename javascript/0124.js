function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var maxPathSum = function(root) {
    function max_rec(root) {
        if (!root) {
            return 0
        } else {
            const l = max_rec(root.left) + root.val
            const r = max_rec(root.right) + root.val
            const me = l + r - root.val
            if (res < l) res = l
            if (res < r) res = r
            if (res < me) res = me
            if (res < root.val) res = root.val
            return Math.max(l, r, root.val)
        }
    };
    var res = -Infinity;
    max_rec(root)
    return res
}
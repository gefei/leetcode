function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var longestUnivaluePath = function(root) {
    function max_rec(root) {
        if (!root) {
            res = 0
        } else {
            let l = max_rec(root.left) 
            let r = max_rec(root.right) 
            if (root.left && root.val === root.left.val) {
                l = l + 1
            } else l = 0
            if (root.right && root.val === root.right.val) {
                r = r + 1
            } else r = 0
            if (res < l) res = l
            if (res < r) res = r

            let me = 0
            if (root.right && root.left && root.val === root.left.val && root.left.val === root.right.val) {
                me = l + r
                if (res < me) res = me
            } 
            return Math.max(l, r)
        }
    };
    var res = 0
    max_rec(root)
    return res 
}
function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}
 
var constructFromPrePost = function(preorder, postorder) {
    return subtree(preorder, postorder, 0, preorder.length-1)
};

function subtree(preorder, postorder, lo, hi) {
    if (lo > hi) return null
    if (lo === hi) return new TreeNode(preorder[lo])
    const v = preorder[lo]
    const idx_v_in_post = postorder.indexOf(v)
    const right = postorder[idx_v_in_post-1]
    const idx_right_in_pre = preorder.indexOf(right)
    return new TreeNode(v, 
                    subtree(preorder, postorder, lo+1, idx_right_in_pre-1),
                    subtree(preorder, postorder, idx_right_in_pre, hi),
    )
}
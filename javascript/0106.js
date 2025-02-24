function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}
 
var buildTree = function(inorder, postorder) {
    return subtree(inorder, postorder, 0, inorder.length-1, 0, inorder.length-1)
};

function subtree(inorder, postorder, lo_in, hi_in, lo_post, hi_post) {
    if (lo_post > hi_post) return null
    if (lo_post === hi_post) return new TreeNode(postorder[lo_post])
    const v = postorder[hi_post]
    const idx_in_in = inorder.indexOf(v)
    const length_right = hi_in - idx_in_in
    return new TreeNode(
        v,
        subtree(inorder, postorder, lo_in, idx_in_in-1, lo_post, hi_post-length_right-1),
        subtree(inorder, postorder, idx_in_in+1, hi_in, hi_post-length_right, hi_post-1),
    )
}
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

let a = [1,2,4,5,3,6,7]
let b = [4,5,2,6,7,3,1]
let res = []
let x = constructFromPrePost(a, b)
pre_o(x, res)
console.log(res)
res = []
post_o(x, res)
console.log(res)


function pre_o(root, a) {
    if (root) {
        a.push(root.val)
        pre_o(root.left, a)
        pre_o(root.right, a)
    }
}

function post_o(root, a) {
    if (root) {
        post_o(root.left, a)
        post_o(root.right, a)
        a.push(root.val)
    }
}


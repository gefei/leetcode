function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}
     
var bstFromPreorder = function(preorder) {
    const root = new TreeNode(preorder[0])
    for (let i = 1; i < preorder.length; i++) {
        const n = preorder[i]
        add(root, n)
    }
    return root
};

function add(root, n) {
    if (root.val === n) return
    if (n < root.val) {
        if (!root.left) {
            root.left = new TreeNode(n)
        } else {
            add(root.left, n)
        }
    } else {
        if (!root.right) {
            root.right = new TreeNode(n)
        } else {
            add(root.right, n)
        }
    }
}
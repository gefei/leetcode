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

// let one = new TreeNode(1)
// let three = new TreeNode(3)
// let two = new TreeNode(2, one, three)
// let six = new TreeNode(6)
// let four = new TreeNode(4, two, six)
// 
// console.log(getMinimumDifference(four))

let t = new TreeNode(2,
    new TreeNode(1)
)
t = new TreeNode(
        543,
        //new TreeNode(384,
        //    null,
        //    new TreeNode(445)
        //),
        null,
        new TreeNode(652, null,
            new TreeNode(699)
        )
    )
console.log(getMinimumDifference(t))
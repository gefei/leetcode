function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var kthSmallest = function(root, k) {
    function* in_order(node) {
        if (!!node) {
            yield* in_order(node.left)
            yield node.val
            yield* in_order(node.right)
        }
    }
    const g = in_order(root)
    for (let i = 0; i < k-1; i++) {
        g.next()
    }
    return g.next().value
};


const one = new TreeNode(1)
const two = new TreeNode(2, one)
const four = new TreeNode(4)
const three = new TreeNode(3, two, four)
const six = new TreeNode(6)
const five = new TreeNode(5, three, six)

console.log(kthSmallest(five, 2))
console.log(kthSmallest(five, 1))
console.log(kthSmallest(five, 4))


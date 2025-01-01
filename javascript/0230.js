function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var kthSmallest = function(root, k) {
    function in_order(node) {
        if (!running) return;
        if (!node) return;
        in_order(node.left)
        c++
        if (c === k) {
            res = node.val
            running = false
            return
        }
        in_order(node.right)
    }
    let c = 0
    let res = undefined
    let running = true
    in_order(root, k)
    return res
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


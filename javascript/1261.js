var FindElements = function(root) {
    this.root = root
};

FindElements.prototype.find = function(target) {
    return rec(this.root, 0, target)
};

function rec(node, value, target) {
    if (!node) return false
    if (value === target) return true
    if (rec(node.left, value*2+1, target)) return true
    if (rec(node.right, value*2+2, target)) return true
    return false
}
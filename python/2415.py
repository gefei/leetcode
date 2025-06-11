class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution(object):
    def reverseOddLevels(self, root):
        if root.left is None: return root
        t = root.left.val
        root.left.val = root.right.val
        root.right.val = t
        self.rec(root.left, root.right, False)
        return root
   
    def rec(self, a, b, is_odd):
        if (a is None): return
        if (is_odd and a.left is not None):
            le = a.left.val
            a.left.val = b.right.val
            b.right.val = le
            ri = a.right.val
            a.right.val = b.left.val
            b.left.val = ri
        self.rec(a.left, b.right, not is_odd)
        self.rec(a.right, b.left, not is_odd)

def read_tree(a):
    n = TreeNode(a[0])
    grow(n, a, 0)
    return n

def grow(n, a, i):
    left = i*2+1
    if left >= len(a): return
    n.left = TreeNode(a[left])
    n.right = TreeNode(a[left+1])
    grow(n.left, a, left)
    grow(n.right, a, left+1)

def output(n):
    res = []
    q = [n]
    while len(q) > 0:
        c = q.pop(0)
        res.append(c.val)
        if c.left is not None:
            q.append(c.left)
            q.append(c.right)
    return res
function TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}

var sortedArrayToBST = function(nums) {
  function toBSTRec(nums, lo, hi)  {
    if (lo > hi) return null
    if (lo === hi) return new TreeNode(nums[lo])
    const mid = parseInt((lo + hi) / 2)
    return new TreeNode(
        nums[mid],
        toBSTRec(nums, lo, mid-1),
        toBSTRec(nums, mid+1, hi),
    )
  }
  return toBSTRec(nums, 0, nums.length-1)
};
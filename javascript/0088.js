var merge = function(nums1, m, nums2, n) {
    let pos = m+n-1;
    let c = 0;
    let [p1, p2] = [m-1, n-1];
    while (c < n) {
       if (p2 < 0) {
           return
       }
       if (p1 < 0) {
           nums1[pos] = nums2[p2];
           p2--;
           c++;
       } else if (nums1[p1] < nums2[p2]) {
           nums1[pos] = nums2[p2];
           p2--;
           c++;
       } else {
           nums1[pos] = nums1[p1];
           p1--;
       }
       pos--;
    }
}

let nums1 = [1,2,3,0,0,0]
let nums2 = [2,5,6]
merge(nums1, 3, nums2, 3)
console.log(nums1)

nums1 = [1]
nums2 = []
merge(nums1, 1, nums2, 0)
console.log(nums1)

nums1 = [0]
nums2 = [1]
merge(nums1, 0, nums2, 1)
console.log(nums1)

nums1 = [2, 0]
nums2 = [1]
merge(nums1, 1, nums2, 1)
console.log(nums1)
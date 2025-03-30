import bisect

class Solution:
    def minAbsoluteSumDiff(self, nums1: list[int], nums2: list[int]) -> int:
        mod = 1e9+7
        s = 0
        s_nums1 = sorted(nums1)
        diff = 0
        for j in range(len(nums2)):
            this_abs = abs(nums1[j] - nums2[j])
            s = s + this_abs
            i = bisect.bisect_left(s_nums1, nums2[j])
            new_abs = 0
            if i == len(nums1):
                new_abs = abs(s_nums1[i-1] - nums2[j])
            elif i == 0:
                new_abs = abs(s_nums1[0] - nums2[j])
            else:
                new_abs = min(abs(s_nums1[i] - nums2[j]), abs(s_nums1[i-1]-nums2[j]))
            if diff < this_abs - new_abs: 
                diff = this_abs - new_abs
        return int((s - diff) % mod)
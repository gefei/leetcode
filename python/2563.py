import bisect

class Solution:
    def countFairPairs(self, nums: list[int], lower: int, upper: int) -> int:
        res = 0
        nums.sort()
        #print(nums)
        i = 0
        while i < len(nums) :
            n = nums[i]
            left = bisect.bisect_left(nums, lower-n, i+1)
            if left == len(nums): 
                i = i + 1
                continue 
            right = bisect.bisect_right(nums, upper-n)
            if left < right: res = res + right-left
            #print(left, right)
            i = i + 1
        return res
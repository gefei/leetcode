var longestOnes = function(nums, k) {
    const len = nums.length
    let start = 0
    let end = 0
    const zero_pos = []
    let zero_idx = 0
    let max_len = 0
    for (let i = 0; i < len; i++) {
        if (nums[i] === 0) {
            if (k === 0) {
                end = i
                max_len = Math.max(max_len, end-start)
                start = end+1
            } else if (zero_idx < k-1) {
                zero_pos[zero_idx] = i
                zero_idx++
                end = i
            } else if (zero_idx === k-1) {
                zero_pos[zero_idx] = i
                zero_idx++
                end = i
                for (let j = i+1; j < len; j++) {
                    if (nums[j] === 0) break
                    end++
                }
                max_len = Math.max(max_len, end-start+1)
            } else {
                start =  zero_pos[0]+1
                for (let j = 0; j < k-1; j++) {
                    zero_pos[j] = zero_pos[j+1]
                }
                zero_pos[k-1] = i
                end = i
                for (let j = i+1; j < len; j++) {
                    if (nums[j] === 0) break
                    end++
                }
                max_len = Math.max(max_len, end-start+1)
            }
        } else {
            end = i
            max_len = Math.max(max_len, end-start+1)
        }
    }
    if (zero_idx < k) {
        return len
    }
    return max_len
};
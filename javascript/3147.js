var maximumEnergy = function(energy, k) {
    const len = energy.length
    let mx = energy[len-1]
    for (let i = 0; i < k; i++) {
        const this_subseq = get_max(energy, i, k, len)
        if (mx < this_subseq) mx = this_subseq
    }
    return mx
};

function get_max(energy, start, k, len) {
    const jumps = parseInt((len - start - 1) / k)
    let mx = energy[start+jumps*k]
    let cur_sum = energy[start]
    for (let i = start+k; i < len; i+=k) {
        const h = energy[i]
        if (cur_sum < 0) {
            cur_sum = h
        } else {
            cur_sum = cur_sum + h
        }
    }
    if (cur_sum > mx) mx = cur_sum
    return mx
}
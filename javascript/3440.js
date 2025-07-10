var maxFreeTime = function(eventTime, startTime, endTime) {
    const empty_length_2_idx = {}
    const empties = [], blocks = []
    let b = 0
    for (let i = 0; i< startTime.length; i++) {
        blocks.push(endTime[i] - startTime[i])
        const empty_length = startTime[i]-b
        empties.push(empty_length)
        b = endTime[i]
        let idx_list = empty_length_2_idx[empty_length]
        if (!idx_list) {
            idx_list = []
            empty_length_2_idx[empty_length] = idx_list
        }
        idx_list.push(i)
    }
    const last_empty_length = eventTime - endTime[endTime.length-1]
    empties.push(last_empty_length)
    idx_list = empty_length_2_idx[last_empty_length]
    if (!idx_list) {
        idx_list = []
        empty_length_2_idx[last_empty_length] = idx_list
    }
    idx_list.push(startTime.length)

    const keys = Object.keys(empty_length_2_idx).sort((a,b) => +b - +a)

    let mx = 0
    for (let i = 0; i < blocks.length; i++) {
        let new_empty = empties[i] + empties[i+1]
        if (exists_empty(empties, blocks[i], i, keys, empty_length_2_idx)) {
            new_empty = new_empty + blocks[i]
        }
        if (mx < new_empty) mx = new_empty
    }
    return mx
};
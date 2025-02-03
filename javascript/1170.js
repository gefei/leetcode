var numSmallerByFrequency = function(queries, words) {
    const q_copy = [...queries]
    const map = {}
    queries.sort(less_than)
    words.sort(less_than)
    let j = 0
    for (let q of queries) {
        while (j<words.length && less_than(q, words[j]) >= 0) { 
            j++ 
        }
        map[q] = words.length - j 
    }
    return q_copy.map(function(q) {
        return map[q]
    })
};

function less_than(q, w) {
    min_q = 'z'; min_w = 'z'
    x = {}; y = {}
    for (c of q) {
        if (!x[c]) x[c] = 0
        x[c]++
        if (min_q > c) min_q = c
    }
    for (c of w) {
        if (!y[c]) y[c] = 0
        y[c]++
        if (min_w > c) min_w = c
    }
    return x[min_q] - y[min_w]
}
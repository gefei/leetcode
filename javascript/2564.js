var substringXorQueries = function(s, queries) {
    function find_substring(s, x, y) {
        const target = x ^ y
        const sub = target.toString(2)
        const idx = s.indexOf(sub)
        if (idx === -1) {
            return [-1, -1]
        } else {
            return [idx, idx+sub.length-1]
        }
    }
    return queries.map(([x, y]) => find_substring(s, x, y))
};

s = "101101"
queries = [[0,5],[1,2]]
console.log(substringXorQueries(s, queries))
s = "0101"
queries = [[12,8]]
console.log(substringXorQueries(s, queries))
console.log(substringXorQueries("1", [[4,5]]))
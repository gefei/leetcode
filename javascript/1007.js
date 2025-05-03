// This solution allows for any arbitrary numbers on the
// domino. The algorithmu could be faster if we emploit the 
// fact both only numbers between 1 and 6 are allowed
var minDominoRotations = function(tops, bottoms) {
    let cnt_same = 0
    const cnt_total = {}
    for (let i = 0; i < tops.length; i++) {
        if (tops[i] === bottoms[i]) {
            cnt_same++
        }

        let c = cnt_total[tops[i]]
        if (c === undefined) {
            c = 0
        }
        cnt_total[tops[i]] = c+1

        c = cnt_total[bottoms[i]]
        if (c === undefined) {
            c = 0
        }
        cnt_total[bottoms[i]] = c + 1
    }
    const cnt_no_dup = tops.length-cnt_same
    let mx = 0, num = -1
    for (let i of Object.keys(cnt_total)) {
        if (cnt_total[i] > mx) {
            mx = cnt_total[i]
            num = +i
        }
    }
    if (mx - cnt_same*2 < cnt_no_dup) return -1
    let c = 0
    for (let i = 0; i < tops.length; i++) {
        if (tops[i] === bottoms[i]) continue
        if (tops[i] === num) {
            c++
        }
    }
    let d = cnt_no_dup - c
    return Math.min(c, d)
};
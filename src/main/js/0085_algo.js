function str_to_arr(s) {
    res = []
    for (let x of s) {
        res.push(x)
    }
    return res
}

let a = str_to_arr('110011001111011111111111111111111110110001110')
let b = str_to_arr('111111111110111111011111111111111111001111111')

function get_intersections(sections1, sections2) {
    let res = []
    let idx1 = 0, idx2 = 0
    while (idx1 < sections1.length && idx2 < sections2.length) {
        let x1 = sections1[idx1][0]
        let x2 = sections1[idx1][1]
        let y1 = sections2[idx2][0]
        let y2 = sections2[idx2][1]
        if (x2 < y1) {
            idx1++
        } else if (y2 < x1) {
            idx2++
        } else if (x1 <= y1 && x2 <= y2) {
            res.push([y1, x2])
            idx1++
        } else if (x1 <= y1 && x2 > y2) {
            res.push([y1, y2])
            idx2++
        } else if (x1 > y1 && x2 <= y2) {
            res.push([x1, x2])
            idx1++
        } else if (x1 > y1 && x1 <= y2 && x2 > y2) {
            res.push([x1, y2])
            idx2 += 1
        } else {
            alert("wrong!")
        }
    }
    return res
}

function get_col_sections(col) {
    let res = []
    let start = 0
    let stop = false
    while (start < col.length && !stop) {
        while (start < col.length && col[start] != '1') start++
        if (start === col.length) stop = true
        else {
            let end = start + 1
            while (end < col.length && col[end] != '0') end++
            res.push([start, end-1])
            start = end + 1
        }
    }
    return res
}

console.log(a)
console.log(b)
let x = get_col_sections(a)
let y = get_col_sections(b)
console.log(x)
console.log(y)
console.log(get_intersections(x, y))

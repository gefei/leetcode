var trap = function(height) {
    const turning = []
    let tendency = 1
    for (let i = 1; i < height.length; i++) {
        if (height[i] === height[i-1]) {
            // do nothing
        } else if (height[i] > height[i-1]) {
            tendency = 1
        } else {
            if (tendency === 1) {
                turning.push(i-1)
            }
            tendency = -1
        }
    }
    if (tendency === 1) turning.push(height.length-1)

    const sup = []
    let max = {
        idx: turning.length-1,
        value: height[turning[turning.length-1]],
    }
    for (let i = turning.length-1; i >=0; i--) {
        sup[i] = []
        if (max.value < height[turning[i]]) {
            max.value = height[turning[i]]
            max.idx = i
        }
        sup[i].value = max.value
        sup[i].idx = max.idx
    }

    let sum = 0
    const len = turning.length
    let a = 0
    let b = -1
    while (a < len-1) {
        b = get_higher(height, turning, a)
        if (b !== -1) {
            const min = Math.min(height[turning[a]], height[turning[b]])
            for (let c = turning[a]+1; c < turning[b]; c++) {
                let diff = min - height[c]
                if (diff < 0) diff = 0
                sum = sum + diff
            }
            a = b
        } else {
            b = sup[a+1].idx
            const min = Math.min(height[turning[a]], height[turning[b]])
            for (let c = turning[a]+1; c < turning[b]; c++) {
                let diff = min - height[c]
                if (diff < 0) diff = 0
                sum = sum + diff
            }
            a = b
        }
    }
    return sum
};

function get_higher(height, turning, a) {
    for (let b = a + 1; b < turning.length; b++) {
        if (height[turning[b]] >= height[turning[a]]) return b
    }
    return -1
}
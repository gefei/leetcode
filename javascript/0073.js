var setZeroes = function(matrix) {
    for (let y = 0; y < matrix.length; y++) {
        for (let x = 0; x < matrix[y].length; x++) {
            if (matrix[y][x] === 0) {
                matrix[0][x] = (x===0) ? 'd' + matrix[0][0] : 0;
                matrix[y][0] = (y===0) ? matrix[0][0] + 'r' : 0;
            }
        }
    }
    for (let y = 1; y < matrix.length; y++) {
        if (Object.is(matrix[y][0],0)) {
            for (let x = 0; x < matrix[y].length; x++) {
                matrix[y][x] = 0;
            }
        }   
    }
    for (let x = 1; x < matrix[0].length; x++) {
        if (Object.is(matrix[0][x],0)) {
            for (let y = 0; y < matrix.length; y++) {
                matrix[y][x] = 0;
            }
        }
    }
    const s = matrix[0][0];
    let l = s.length;
    if (s[l-1] === 'r') {
        for (let x = 0; x < matrix[0].length; x++) {
            matrix[0][x] = 0;
        }
    }
    if (s[0] === 'd') {
        for (let y = 0; y < matrix.length; y++) {
            matrix[y][0] = 0;
        }
    }
};
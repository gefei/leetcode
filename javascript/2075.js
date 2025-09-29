var decodeCiphertext = function(encodedText, rows) {
    const len = encodedText.length
    const width = len/rows
    let s = ''
    for (let x = 0; x < width; x++) {
        for (let i = x; i < len; i += width+1) {
            s = s + encodedText[i]
        }
    }
    return s.replace(/ +$/, '');
};
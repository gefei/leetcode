var clearDigits = function(s) {
    const regex = /[a-z]\d/
    while (regex.test(s)) {
        s = s.replace(regex, '')
    }
    return s
};
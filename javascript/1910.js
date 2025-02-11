var removeOccurrences = function(s, part) {
    let i = s.indexOf(part)
    while (i !== -1) {
        s = s.replace(part, '')
        i = s.indexOf(part)
    }
    return s
};
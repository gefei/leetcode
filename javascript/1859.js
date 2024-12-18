var sortSentence = function(s) {
    let words = s.split(' ')
    words.sort((a, b) => a[a.length-1] - b[b.length-1])
    return words.map(x => x.substring(0, x.length-1)).join(' ')
};

console.log(sortSentence("is2 sentence4 This1 a3"))
console.log(sortSentence("Myself2 Me1 I4 and3"))
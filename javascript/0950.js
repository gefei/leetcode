var deckRevealedIncreasing = function(deck) {
    deck.sort((a, b) => a-b)
    let i = 0
    const res = []
    const len = deck.length
    for (let p = 0; p < len-1; p++) {
        const n = deck[p]
        res[i] = n
        let c = 0
        while (c !== 2) {
            i = (i+1) % len
            if (res[i] === undefined) c++
        }
    }
    res[i] = deck[len-1]
    return res
};
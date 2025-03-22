var Trie = function() {
    this.root = {}
};

Trie.prototype.insert = function(word) {
    let r = this.root
    for (let c of word) {
        r = add_char(r, c)
    }
    r.accept = true
};

function add_char(root, c) {
    let trie = root[c]
    if (trie) {
        return trie
    } else {
        const node = {}
        root[c] = node
        return node
    }
}

Trie.prototype.search = function(word) {
    let r = this.root
    for (let c of word) {
        if (!r[c]) return false
        r = r[c]
    }
    return !!r.accept
};

Trie.prototype.startsWith = function(prefix) {
    let r = this.root
    for (let c of prefix) {
        if (!r[c]) return false
        r = r[c]
    }
    return true
}
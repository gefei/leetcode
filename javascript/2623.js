function memoize(fn) {
    const map = {}
    return function(...args) {
        const key = JSON.stringify(args)
        if (map[key] !== undefined) return map[key]
        const value = fn(...args)
        map[key] = value
        return value
    }
}

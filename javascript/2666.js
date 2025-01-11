var once = function(fn) {
    let fresh = true

    return function(...args) {
        if (fresh) {
            fresh = false
            return fn.apply(null, args)
        }
    }
}
var sortBy = function(arr, fn) {
    arr.sort((a,b) => {return fn(a) - fn(b)})
    return arr
};
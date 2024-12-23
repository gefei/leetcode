var nthUglyNumber = function(n) {
    function main() {
        if (n === 1) {
            return 1
        }
        const visited = new Set([1])
        const list = [1]
        const factors = [2,3,5]
        let c = 1
        let res = 0
        while (c <= n) {
            res = list.shift()
            for (let i of [2, 3, 5]) {
                const t = i * res
                if (!visited.has(t)) {
                    visited.add(t)
                    list.push(t)
                    list.sort((x, y) => +x - +y)
                }
            }
            c++
        }
        return res
    }
    return main()
};

console.log(nthUglyNumber(149))
//console.log(nthUglyNumber(11))
//console.log(nthUglyNumber(10))
//console.log(nthUglyNumber(1))
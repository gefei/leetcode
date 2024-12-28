var minSteps = function(n) {
    function success(node) {
        console.log(node)
    }
    function fail() {
        console.log('no solution')
    }
    function get_candidates(node) {
        const res = [{
            display: node.display,
            clip: node.display,
            step: node.step + 1,
        }]
        if (node.display + node.clip <= n) {
            res.push({
                display: node.display + node.clip,
                clip: node.clip,
                step: node.step + 1
            })
        }
        return res
    }
    function hash(node) {
        return `dis: ${node.display} clip: ${node.clip}`
    }
    const start = {
        display: 1,
        clipboard: 0,
        step: 0,
    }
    const queue = [start]
    const visited = new Set()
    const displayed = new Set()
    while (queue.length !== 0) {
        const cur = queue.shift()
        visited.add(cur)
        if (!displayed.has(cur.step)) {
            console.log(cur.step)
            displayed.add(cur.step)
        }
        if (cur.display === n) {
            success(cur)
            return
        }
        for (let candi of get_candidates(cur)) {
            if (!visited.has(hash(candi))) {
                queue.push(candi)
            }
        }
    }
    fail()
}

minSteps(21)
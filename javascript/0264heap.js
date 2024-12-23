var nthUglyNumber = function(n) {
    function get_left_child(p) {
        return p*2 + 1
    }
    function get_parent(p) {
        return parseInt((p-1)/2)
    }
    function sift_down(heap, root, end) {
        while (get_left_child(root) <= end) {
            child = get_left_child(root)
            if (child+1 <= end && heap[child] > heap[child+1]) {
                child = child + 1
            }
            if (heap[root] > heap[child]) {
                [heap[root], heap[child]] = [heap[child], heap[root]]
                root = child
            } else {
                return
            }
        }
    }
    function sift_up(heap, pos) {
        while (pos > 0) {
            let parent = get_parent(pos)
            if (heap[parent] > heap[pos]) {
                [heap[parent], heap[pos]] = [heap[pos], heap[parent]]
                pos = parent
            } else {
                return
            }
        }
    }
    function push(heap, x) {
        heap.push(x)
        sift_up(heap, heap.length-1)
    }
    function pop(heap) {
        const res = heap[0]
        const t = heap.pop()
        if (heap.length > 0) {
            heap[0] = t
            sift_down(heap, 0, heap.length-1)
        }
        return res
    }

    function main() {
        let h = [1]
        let c = 0
        let res = 0
        const visited = new Set()
        while (c < n) {
            res = pop(h)
            visited.add(res)
            const candis = new Set([res*2, res*3, res*5])
            for (x of candis) {
                if (!visited.has(x)) {
                    visited.add(x)
                    push(h, x)
                }
            }
            c++
        }
        return res
    }
    return main()
};

console.log(nthUglyNumber(3))
console.log(nthUglyNumber(5))
console.log(nthUglyNumber(10))


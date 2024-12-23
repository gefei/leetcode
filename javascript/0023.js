var mergeKLists = function(lists) {
    function get_index_list_of_min(cursors) {
        let min = 10001
        let res = 0
        for (let i = 0; i < cursors.length; i++) {
            let l = cursors[i]
            if (!!l && l.val < min) {
                min = l.val
                res = i
            }
        }
        return res
    }
    function finished(cursors) {
        for (let l of cursors) {
            if (!!l) {
                return false
            }
        }
        return true
    }
    function main() {
        const cursors = lists
        const head = new ListNode(null)
        let current = head
        if (finished(cursors)) {
            head.next = new ListNode()
            return head.next
        }
        while (!finished(cursors)) {
            let idx = get_index_list_of_min(cursors)
            const l = cursors[idx]
            const new_node = new ListNode(l.val)
            current.next = new_node
            current = new_node
            cursors[idx] = cursors[idx].next
        }
        return head.next
    }
    return main()
}

function ListNode(val, next) {
    this.val = (val===undefined ? 0 : val)
    this.next = (next===undefined ? null : next)
}

function print(l) {
    let cursor = l
    let result = []
    while (!!cursor) {
        result.push(cursor.val)
        cursor = cursor.next
    }
    console.log(result)
}

function array_to_list(arr) {
    let head = {
        val: 0,
    }
    let current = head
    for (let v of arr) {
        let new_node = {
            val: v
        }
        current.next = new_node
        current = new_node
    }
    return head
}

let l1 = array_to_list([1,4,5])
let l2 = array_to_list([1,3,4])
let l3 = array_to_list([2,6])

print(l1.next)
print(l2.next)
print(l3.next)

print(mergeKLists([l1.next, l2.next, l3.next]))
print(mergeKLists([]))
print(mergeKLists([[]]))
function ListNode(val, next) {
    this.val = val;
    this.next = (!!next) ? next : null;
}
 
var hasCycle = function(head) {
    let [first, second] = [head, head]
    while (true) {
        if (first === null) {
            return false
        }
        first = first.next
        if (first === second) {
            return true
        }
        second = second.next
        if (first === null) {
            return false
        }
        first = first.next
        if (first === second) {
            return true
        }
    }
};


function make_cycle(head, pos) {
    let [tail, at_pos, c] = [head, head, 0]
    while (tail.next !== null) {
        tail = tail.next
    }
    while (c != pos) {
        c++
        at_pos = at_pos.next
    }
    tail.next = at_pos
}

function print_cycle_list(head, pos) {
    let stop = null
    let cur = head
    let c = 0
    while (cur !== null && cur !== stop) {
        console.log(cur.val)
        if (c === pos) {
            stop = cur
        } 
        cur = cur.next
        c++
    }
}

let l4 = new ListNode(-4)
let l3 = new ListNode(0, l4)
let l2 = new ListNode(2, l3)
let l1 = new ListNode(3, l2)
make_cycle(l1, 1)
console.log(hasCycle(l1))

l2 = new ListNode(2)
l1 = new ListNode(1, l2)
make_cycle(l1, 0)
console.log(hasCycle(l1))

l1 = new ListNode(1)
console.log(hasCycle(l1))

l2 = new ListNode(2)
l1 = new ListNode(1, l2)
console.log(hasCycle(l1))

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
function ListNode(val, next) {
    this.val = (val===undefined ? 0 : val)
    this.next = (next===undefined ? null : next)
}

/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    const head = new ListNode(0)
    let current = head
    let c = 0
    while (l1 != null && l2 != null) {
        let s = l1.val + l2.val + c
        let r = s % 10
        c = parseInt(s / 10)
        let new_code = new ListNode(r)
        current.next = new_code
        current = new_code
        l1 = l1.next
        l2 = l2.next
    }
    while (l1 != null) {
        let s = l1.val + c
        let r = s % 10
        c = parseInt(s / 10)
        let new_code = new ListNode(r)
        current.next = new_code
        current = new_code
        l1 = l1.next
    }
    while (l2 != null) {
        let s = l2.val + c
        let r = s % 10
        c = parseInt(s / 10)
        let new_code = new ListNode(r)
        current.next = new_code
        current = new_code
        l2 = l2.next
    }
    if (c > 0) {
        let new_code = new ListNode(c)
        current.next = new_code
    }
    return head.next
};

function print(l) {
    let cursor = l.next
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

let l1 = array_to_list([9,9,9,9,9,9,9])
let l2 = array_to_list([9,9,9,9])
let l3 = array_to_list([2,4,3])
let l4 = array_to_list([5,6,4])
print(addTwoNumbers(l1, l2))
print(addTwoNumbers(l3, l4))
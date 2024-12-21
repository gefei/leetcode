 function ListNode(val, next) {
     this.val = (val===undefined ? 0 : val)
     this.next = (next===undefined ? null : next)
 }
 
var mergeTwoLists = function(list1, list2) {
    const head = new ListNode(0)
    let current = head
    while (!!list1 && !!list2) {
        if (list1.val < list2.val) {
            const node = new ListNode(list1.val);
            list1 = list1.next;
            current.next = node;
            current = node
        } else {
            const node = new ListNode(list2.val);
            list2 = list2.next;
            current.next = node;
            current = node
        }
    }
    if (!list1) {
        current.next = list2
    }
    if (!list2) {
        current.next = list1
    }
    return head.next;
};

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

let l1 = array_to_list([1,2,4])
let l2 = array_to_list([1,3,4])
let l3 = array_to_list([])
let l4 = array_to_list([])
let l5 = array_to_list([])
let l6 = array_to_list([0])
print(mergeTwoLists(l1.next, l2.next))
print(mergeTwoLists(l3.next, l4.next))
print(mergeTwoLists(l5.next, l6.next))
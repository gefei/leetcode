#lang racket

(struct list-node
  (val next) #:mutable #:transparent)

(define (make-list-node [val 0])
  (list-node val #f))

(define/contract (merge-two-lists list1 list2)
  (-> (or/c list-node? #f) (or/c list-node? #f) (or/c list-node? #f))
  (define/contract (reverse l)
    (-> (or/c list-node? #f) (or/c list-node? #f))
    (define (rec l acc)
      (if (equal? l #f) 
       acc
       (rec (list-node-next l) (list-node (list-node-val l) acc)))
    )
    (rec l #f)
  )
  (define (rec l1 l2 acc)
    (cond
      [(and (not l1) (not l2)) acc]
      [(and l1 (not l2)) 
       (rec (list-node-next l1) l2 (list-node (list-node-val l1) acc))]
      [(and l2 (not l1)) 
       (rec l1 (list-node-next l2) (list-node (list-node-val l2) acc))]
      [(and l1 l2)
        (if (< (list-node-val l1) (list-node-val l2))
          (rec (list-node-next l1) l2 (list-node (list-node-val l1) acc))
          (rec l1 (list-node-next l2) (list-node (list-node-val l2) acc))
        )
      ]
    )
  )
  (reverse (rec list1 list2 #f))
)

(define l1 
  (list-node 2 (list-node 4 (list-node 4 (make-list-node 6)))))
(define l2 
  (list-node 1 (list-node 5 (list-node 6 (make-list-node 9)))))
(println (merge-two-lists l1 l2))

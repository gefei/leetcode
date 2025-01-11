#lang racket

(struct list-node
  (val next) #:mutable #:transparent)
(define (make-list-node [val 0])
  (list-node val #f))

(define/contract (middle-node head)
  (-> (or/c list-node? #f) (or/c list-node? #f))
  (define (rec fast slow)
      (cond [(not fast) slow]
            [(not (list-node-next fast)) slow]
            [else (rec (list-node-next (list-node-next fast)) (list-node-next slow))
            ]
      ))
  (rec head head))

(middle-node (list-node 1 (list-node 2 (list-node 3 (list-node 4 (make-list-node 5))))))
(middle-node (list-node 1 (list-node 2 (list-node 3 (list-node 4 (list-node 5 (make-list-node 6)))))))
(middle-node (make-list-node 1))
(middle-node (list-node 1 (make-list-node 2)))

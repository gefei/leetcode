; Definition for singly-linked list:
#|

; val : integer?
; next : (or/c list-node? #f)
(struct list-node
  (val next) #:mutable #:transparent)

; constructor
(define (make-list-node [val 0])
  (list-node val #f))

|#

#lang racket

(struct list-node
  (val next) #:mutable #:transparent)

(define (make-list-node [val 0])
  (list-node val #f))

(define/contract (add-two-numbers l1 l2)
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

  (define (module-10 l1 l2 c) 
   (let ([s (+ l1 l2 c)])
     (modulo s 10)))
  (define (carry-10 l1 l2 c) 
   (let ([s (+ l1 l2 c)])
     (if (> s 9) 1 0)))

  (define (rec l1 l2 c acc)
      (cond 
        [(and l1 l2) 
         (rec 
           (list-node-next l1) 
           (list-node-next l2)
           (carry-10 (list-node-val l1) (list-node-val l2) c)
           (list-node (module-10 (list-node-val l1) (list-node-val l2) c) acc))]
        [(and l1 (not l2))
          (rec
            (list-node-next l1) 
            l2
            (carry-10 (list-node-val l1) 0 c)
            (list-node (module-10 (list-node-val l1) 0 c) acc))]
        [(and (not l1) l2)
          (rec
            l1
            (list-node-next l2) 
            (carry-10 0 (list-node-val l2) c)
            (list-node (module-10 0 (list-node-val l2) c) acc))]
        [(and (not l1) (not l2)) 
          (if (equal? c 0)
            acc 
            (list-node (module-10 0 0 c) acc))]))
  (list-node-next (reverse (rec l1 l2 0 (make-list-node 0))))
)

(define l1 
  (list-node 2 (list-node 4 (list-node 3 (make-list-node 6)))))
(define l2 
  (list-node 1 (list-node 5 (list-node 6 (make-list-node 4)))))
(println (add-two-numbers l1 l2))




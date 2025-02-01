#lang racket

(struct list-node
  (val next) #:mutable #:transparent)
(define (make-list-node [val 0])
  (list-node val #f))

(define/contract (swap-nodes head k)
  (-> (or/c list-node? #f) exact-integer? (or/c list-node? #f))
  
  (define (reverse head)
    (define (rec head acc)
        (cond [(not head) acc]
              [else (rec (list-node-next head) (list-node (list-node-val head) acc))]))
    (rec head #f))

  (define (len head)
    (define (rec head acc)
        (cond 
          [(not head) acc]
          [else (rec (list-node-next head) (add1 acc))]))
    (rec head 0))

  (define (main-loop lg head rev n acc)
    (cond [(not head) acc]
          [else 
            (let 
            ([v (cond 
                   [(equal? n k) (list-node-val rev)] 
                   [(equal? n (add1 (- lg k))) (list-node-val rev)]
                   [else (list-node-val head)])])
            (main-loop lg
                       (list-node-next head) 
                       (list-node-next rev) 
                       (add1 n)
                       (list-node v acc)))]))
  (reverse (main-loop (len head) head (reverse head) 1 #f)))
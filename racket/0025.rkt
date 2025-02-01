#lang racket

(struct list-node
  (val next) #:mutable #:transparent)
(define (make-list-node [val 0])
  (list-node val #f))

(define/contract (reverse-k-group head k)
  (-> (or/c list-node? #f) exact-integer? (or/c list-node? #f))
  
  (define (reverse lst start)
    (define (rec lst acc)
      (cond
        [(not lst) acc]
        [else (rec (list-node-next lst) (list-node (list-node-val lst) acc))]))
    (rec lst start))

  (define (take n lst)
    (define (rec n lst acc c)
        (cond
            [(zero? n) (list acc c)]
            [(not lst) (list acc c)]
            [else (rec (- n 1) 
                       (list-node-next lst) 
                       (list (list-node (list-node-val lst) (first acc)) (list-node-next lst))
                       (add1 c)
                       )]))
    (rec n lst (list #f #f) 0))

  (define (main-loop lst acc)
    (cond
        [(not lst) acc]
        [else (let* ([k_nodes (take k lst)]
                     [part (first (first k_nodes))]
                     [rest (second (first k_nodes))]
                     [count (second k_nodes)])
               (main-loop rest (reverse (if (< count k) (reverse part #f) part) acc)))]))

  (reverse (main-loop head #f) #f))
(reverse-k-group (list-node 1 (list-node 2 (list-node 3 (list-node 4 (make-list-node 5))))) 2)
(reverse-k-group (list-node 1 (list-node 2 (list-node 3 (list-node 4 (make-list-node 5))))) 3)
(reverse-k-group (list-node 1 (list-node 2 (list-node 3 (list-node 4 (make-list-node 5))))) 10)
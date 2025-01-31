#lang racket

(struct list-node
  (val next) #:mutable #:transparent)
(define (make-list-node [val 0])
  (list-node val #f))

(define/contract (swap-pairs head)
  (-> (or/c list-node? #f) (or/c list-node? #f))
  (define (swap head acc)
    (cond
        [(not head) acc]
        [(not (list-node-next head)) (list-node (list-node-val head) acc)]
        [(not (list-node-next (list-node-next head))) (list-node (list-node-val head) (list-node (list-node-val (list-node-next head)) acc))]
        [else 
            (swap (list-node-next (list-node-next head)) 
                 (list-node (list-node-val head) (list-node (list-node-val (list-node-next head)) acc)))]))
  (define (rev lst)
    (define (rec lst acc)
        (cond 
            [(not lst) acc]
            [else (rec (list-node-next lst) (list-node (list-node-val lst) acc))])) 
    (rec lst #f))
  (rev (swap head #f)))
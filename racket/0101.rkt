#lang racket

(struct tree-node
  (val left right) #:mutable #:transparent)
(define (make-tree-node [val 0])
  (tree-node val #f #f))


(define/contract (is-symmetric root)
  (-> (or/c tree-node? #f) boolean?)
  (define (two-symmetric? left right)
    (cond
        [(and (not left) (not right )) #t]
        [(and left (not right )) #f]
        [(and (not left) right) #f]
        [(not (equal? (tree-node-val left) (tree-node-val right))) #f]
        [else 
            (and (two-symmetric? (tree-node-left left) (tree-node-right right))
                 (two-symmetric? (tree-node-right left) (tree-node-left right)))]))
  (two-symmetric? (tree-node-left root) (tree-node-right root)))

  (define x 
      (tree-node 1 
      (tree-node 2 (make-tree-node 3) (make-tree-node 4)) 
      (tree-node 2 (make-tree-node 3) (make-tree-node 4))))
  (is-symmetric x)
  (define y 
      (tree-node 1 
      (tree-node 2 (make-tree-node 3) (make-tree-node 4)) 
      (tree-node 2 (make-tree-node 4) (make-tree-node 3))))
  (is-symmetric y)
#lang racket

(struct tree-node
  (val left right) #:mutable #:transparent)
(define (make-tree-node [val 0])
  (tree-node val #f #f))

(define/contract (is-valid-bst root)
  (-> (or/c tree-node? #f) boolean?)
  (define (rec root lo hi parent)
      (cond
          [(not root) #t]
          [(<= (tree-node-val root) lo) #f]
          [(>= (tree-node-val root) hi) #f]
          [else 
              (and
               (rec (tree-node-left root) lo (min (tree-node-val root) hi) root)
               (rec (tree-node-right root) (max (tree-node-val root) lo) hi root))]))
  (rec root (- (- (expt 2 31)) 1) (expt 2 31) #f)
)

(define x 
     (tree-node 2 
     (make-tree-node 1) (make-tree-node 3))) 
(is-valid-bst x)
(define y 
     (tree-node 2 
     (make-tree-node 3) (make-tree-node 1))) 
(is-valid-bst y)
(define z 
     (tree-node 5 
     (make-tree-node 1)
     (tree-node 4 (make-tree-node 3) (make-tree-node 6))))
(is-valid-bst z)
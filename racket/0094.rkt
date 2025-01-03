#lang racket

(struct tree-node
  (val left right) #:mutable #:transparent)
(define (make-tree-node [val 0])
  (tree-node val #f #f))


(define/contract (inorder-traversal root)
  (-> (or/c tree-node? #f) (listof exact-integer?))
  (if (not root)
    (list)
    (append (inorder-traversal (tree-node-left root)) 
            (list (tree-node-val root)) 
            (inorder-traversal (tree-node-right root)))))
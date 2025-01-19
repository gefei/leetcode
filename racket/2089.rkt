#lang racket

(define/contract (target-indices nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (let ([arr (sort nums <)])
     (for/list 
        ([n arr] 
         [i (in-naturals)] #:when (equal? target n))
        i)))

(target-indices (list 1 2 5 2 3) 2)
(target-indices (list 1 2 5 2 3) 3)
(target-indices (list 1 2 5 2 3) 5)
  
  
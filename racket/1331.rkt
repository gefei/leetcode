#lang racket

(define/contract (array-rank-transform arr)
  (-> (listof exact-integer?) (listof exact-integer?))
  (let* 
    ([nums (list->set arr)]
     [x (sort (set->list nums) <)]
     [num->idx 
       (for/hash 
         ([n x]
          [i (in-naturals)])
         (values n i))])
    (for/list ([n arr])
              (add1 (hash-ref num->idx n)))))

(array-rank-transform (list 40 10 20 30))
(array-rank-transform (list 37 12 28 9 100 56 80 5 12))
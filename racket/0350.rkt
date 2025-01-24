#lang racket

(define/contract (intersect nums1 nums2)
  (-> (listof exact-integer?) (listof exact-integer?) (listof exact-integer?))
  (define (rec lst1 lst2 acc)
      (cond 
         [(zero? (length lst1)) acc]
         [(zero? (length lst2)) acc]
         [else 
             (let ([a (first lst1)]
                   [b (first lst2)])
                (cond
                   [(< a b) (rec (cdr lst1) lst2 acc)]
                   [(> a b) (rec lst1 (cdr lst2) acc)]
                   [else (rec (cdr lst1) (cdr lst2) (cons a acc))]
                ))]))
  (let* ([s1 (sort nums1 <)]
         [s2 (sort nums2 <)])
         (rec s1 s2 (list))))
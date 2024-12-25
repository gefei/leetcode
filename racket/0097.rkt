#lang racket

(define/contract (sorted-squares nums)
  (-> (listof exact-integer?) (listof exact-integer?))
 
  (define (rec arr a b acc)
    (define (square n) (* n n))
    (if (> a b) acc
      (if (> (square (list-ref arr a)) (square (list-ref arr b)))
        (rec arr (+ a 1) b (cons (square (list-ref arr a)) acc))
        (rec arr a (- b 1) (cons (square (list-ref arr b)) acc))
      )))
  (rec nums 0 (- (length nums) 1) (list))
)

(sorted-squares (list -4  -1  0  3  10))
(sorted-squares (list -7  -3  2  3  11))
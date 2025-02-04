#lang racket

(define/contract (decompress-rl-elist nums)
  (-> (listof exact-integer?) (listof exact-integer?))

  (define (fill-array freq n)
    (define (rec freq acc)
        (if (zero? freq) acc (rec (sub1 freq) (cons n acc))))
    (rec freq (list)))

  (define (rec nums acc)
    (cond[(zero? (length nums)) acc]
         [else (rec (cdr (cdr nums)) (append acc (fill-array (first nums) (second nums))))]))
    (rec nums (list)))
#lang racket

(define/contract (max-ascending-sum nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (rec nums last-n cur acc)
    (cond [(zero? (length nums)) (max cur acc)]
          [(< last-n (first nums)) (rec (cdr nums) (first nums) (+ cur (first nums)) acc)]
          [else (rec (cdr nums) (first nums) (first nums) (max acc cur))]))
  (if (equal? 1 (length nums)) (first nums) (rec (cdr nums) (first nums) (first nums) 0)))

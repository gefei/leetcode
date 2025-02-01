#lang racket

(define/contract (is-array-special nums)
  (-> (listof exact-integer?) boolean?)
  (cond
    [(equal? (length nums) 1) #t]
    [else (for/and ([a nums]
                    [b (cdr nums)])
                    (not (equal? (modulo a 2) (modulo b 2))))]))
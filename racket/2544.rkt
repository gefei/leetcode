#lang racket

(define/contract (alternate-digit-sum n)
  (-> exact-integer? exact-integer?)
  (define (rec n sign acc)
    (cond 
      [(equal? n 0) (- (* sign acc))]
      [else (rec (quotient n 10) (- sign) (+ acc (* sign (modulo n 10))))]
    )
  )
  (rec n 1 0))
(alternate-digit-sum 521)
(alternate-digit-sum 111)
(alternate-digit-sum 886997)
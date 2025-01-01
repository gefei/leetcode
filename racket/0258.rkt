#lang racket

(define/contract (add-digits num)
  (-> exact-integer? exact-integer?)
  (define (rec n acc)
     (cond 
       [(equal? n 0) acc]
       [else (rec (quotient n 10) (+ acc (modulo n 10)))]))
  (define (loop n)
    (cond
      [(< n 10) n]
      [else (loop (rec n 0))]))
  (loop num))

(add-digits 38)
(add-digits 0)

      
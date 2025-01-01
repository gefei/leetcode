#lang racket

(define/contract (is-happy n)
  (-> exact-integer? boolean?)
  (define/contract (sum-square s)
    (-> exact-integer? exact-integer?)
    (define (rec n acc)
      ;(-> exact-integer? exact-integer?)
      (if (< n 10)
         (+ acc (* n n)) 
         (let ([r (modulo n 10)]
               [next (quotient n 10)])
               (rec next (+ acc (* r r))))))
    (rec s 0))
  (define (loop n acc)
    (let ([res (sum-square n)])
        (cond 
            [(equal? res 1) #t]
            [(set-member? acc res) #f]
            [else (loop res (set-add acc res))])))
  (loop n (set))
)

(println (is-happy 19))
(println(is-happy 2))


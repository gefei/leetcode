#lang racket

(define/contract (distinct-prime-factors nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (prime-factors n)
      (define (divide-thru n divi)
          (if (equal? (modulo n divi) 0)
              (divide-thru (quotient n divi) divi)
              n
          )
      )
      (define (loop n divi acc) 
          (cond 
              [(< n divi) acc]
              [(equal? (modulo n divi) 0)
                      (loop (divide-thru n divi) (+ divi 1) (set-add acc divi))]
              [else (loop n (+ divi 1) acc)]
          )
      )
      (loop n 2 (set))
  )
  (define (rec lst acc)
    (if (equal? (set-count lst) 0) 
        acc
        (rec (rest lst) (set-union acc (prime-factors (first lst))))))
  (set-count (rec nums (set)))
)


(distinct-prime-factors (list 2 4 8 16))
(distinct-prime-factors (list 2 4 3 7 10 6))
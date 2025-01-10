#lang racket

(define/contract (smallest-value num)
  (-> exact-integer? exact-integer?)
  (define (prime-factor-dict n)
      (define (divide-thru n divi count)
          (if (equal? (modulo n divi) 0)
              (divide-thru (quotient n divi) divi (add1 count))
              (list n count)))
      (define (loop n divi acc) 
          (cond 
              [(< n divi) acc]
              [(equal? (modulo n divi) 0)
                      (let* ([r (divide-thru n divi 0)]
                             [k (first r)] 
                             [v (second r)])
                          (loop k (+ divi 1) (hash-set acc divi v)))]
              [else (loop n (+ divi 1) acc)]))
      (loop n 2 (hash)))
  (define (main n)
    (let* ([d (prime-factor-dict n)]
           [sum (apply + (for/list ([(k v) d]) (* k v)))])
        (if (< sum n)
            (main sum)
            sum)))
  (main num))

(smallest-value 20)
(smallest-value 15)
(smallest-value 3)
(smallest-value 4)
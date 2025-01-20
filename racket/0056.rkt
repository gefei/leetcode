#lang racket

(define/contract (merge intervals)
  (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)))
  
  (define (merge-one this others)
    (cond 
        [(zero? (length others)) (list this others)]
        [(>= (second this) (first (first others))) 
              (merge-one (list (first this) (max (second this) (second (first others)))) (rest others))]
        [else (list this others)]
    )
  )

  (define (res intervals acc)
    (cond
        [(zero? (length intervals)) acc]
        [(equal? 1 (length intervals)) (append acc (list (first intervals)))]
        [else (let ([one-result (merge-one (first intervals) (rest intervals))])
            (res (second one-result) (append acc (list (first one-result)))))]))

  (let 
    ([sorted (sort intervals < #:key (lambda (x) (car x)))])
    (res sorted (list))))

(merge (list (list 1 3) (list 2 6) (list 8 10) (list 15 18)))
(merge (list (list 1 4) (list 4 5)))
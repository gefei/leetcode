#lang racket

(define/contract (find-poisoned-duration timeSeries duration)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (define (f t acc)
    (let ([until (first acc)]
          [sum (second acc)])
        (if (< until t) 
            (list (+ t duration) (+ sum duration))
            (list (+ t duration) (+ sum (- duration (- until t)))))
    ))
  (second (foldl f (list 0 0) timeSeries))
)

(find-poisoned-duration (list 1 4) 2)
(find-poisoned-duration (list 1 2) 2)
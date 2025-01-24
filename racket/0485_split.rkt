#lang racket

(define/contract (find-max-consecutive-ones nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* ([words (string-split (string-join (map number->string nums) "") "0")]
         [lens (map string-length words)])
    (if (zero? (length lens)) 0 (apply max lens))))
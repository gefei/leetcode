#lang racket

(define/contract (num-sub s)
  (-> string? exact-integer?)
  (let* ([lens (for/list ([match (regexp-split #rx"[^1]" s)])
                         (string-length match))]
         [n-of-one (for/list ([n lens])
                   (/ (* n (add1 n)) 2))])
         (println lens)
         (modulo (for/sum ([n n-of-one]) n) 1000000007)))



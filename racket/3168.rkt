#lang racket

(define/contract (minimum-chairs s)
  (-> string? exact-integer?)
  (define (rec s current mx)
    (cond [(zero? (string-length s)) mx]
        [(equal? (string-ref s 0) #\E) (rec (substring s 1) (add1 current) (max mx (add1 current)))]
        [(equal? (string-ref s 0) #\L) (rec (substring s 1) (sub1 current) mx)]))
  (rec s 0 0))
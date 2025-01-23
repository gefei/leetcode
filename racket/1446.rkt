#lang racket
(define/contract (max-power s)
  (-> string? exact-integer?)
  (define (rec cur-c rest-s cur-len mx)
    ;(println (list cur-c rest-s cur-len mx))
    (cond
      [(zero? (string-length rest-s)) mx]
      [(equal? cur-c (string-ref rest-s 0)) (rec cur-c (substring rest-s 1) (add1 cur-len) (max (add1 cur-len) mx))]
      [else (rec (string-ref rest-s 0) (substring rest-s 1) 1 (max cur-len mx))]))
    (cond
      [(equal? 1 (string-length s)) 1]
      [else (rec (string-ref s 0) (substring s 1) 1 1)]))
#lang racket

(define/contract (is-same-after-reversals num)
  (-> exact-integer? boolean?)
  (or (zero? num) (not (zero? (modulo num 10)))))

(is-same-after-reversals 526)
(is-same-after-reversals 1800)
(is-same-after-reversals 0)
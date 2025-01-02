#lang racket

(define/contract (is-subsequence s t)
  (-> string? string? boolean?)
  (cond
      [(equal? (string-length s) 0) #t]
      [(equal? (string-length t) 0) #f]
      [(equal? (string-ref s 0) (string-ref t 0)) 
        (is-subsequence (substring s 1) (substring t 1))]
      [else (is-subsequence s (substring t 1))]))

(is-subsequence "abc" "ahbgdc")
(is-subsequence "axc" "ahbgdc")
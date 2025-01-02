#lang racket

(define/contract (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define (update-hash ht k v)
    (let ([val (hash-ref ht k (list))])
        (hash-set ht k (cons v val))))
  (define (build-dict l)
    (define (rec lst n acc)
        (cond
            [(equal? (length lst) 0) acc]
            [else (rec (rest lst) (+ n 1) (update-hash acc (first lst) n))]))
    (rec l 0 (hash)))
  (define (find nums target ht)
    (let* ([n (first nums)]
           [d (- target n)]
           [l1 (hash-ref ht n)]
           [l2 (hash-ref ht d #f)])
          (cond
           [(not l2) (find (rest nums) target ht)]
           [(and l2 (not (equal? n d))) (list (first l1) (first l2))]
           [(and l2 (equal? n d) (equal? (length l1) 2)) (list (first l1) (second l1)) ]
           [else (find (rest nums) target ht)])))
  (find nums target (build-dict nums)))

(two-sum (list 1 4 9) 10)
(two-sum (list 2 7 11 15) 9)
(two-sum (list 3 2 4) 6)
(two-sum (list 3 3) 6)
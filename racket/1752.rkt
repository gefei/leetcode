#lang racket

(define/contract (check nums)
  (-> (listof exact-integer?) boolean?)
  (define (streak last nums)
    (cond
        [(zero? (length nums)) (list last nums)]
        [(equal? 1 (length nums)) (list (car nums) (cdr nums))]
        [(>= (second nums) (first nums)) (streak (second nums) (cdr nums))]
        [else (list last (cdr nums))]))
  (define (with-break)
    (let* ([first-one (streak (first nums) nums)]
           [last-of-first (first first-one)]
           [second-one (streak last-of-first (second first-one))])
         (cond
           [(zero? (length (second first-one))) #t]
           [(not (zero? (length (second second-one)))) #f]
           [(not (<= (first second-one) (first nums))) #f]
           [else #t])))
  (cond
    [(equal? (length nums) 1) #t]
    [else (with-break)]))
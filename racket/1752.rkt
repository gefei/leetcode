#lang racket

(define/contract (check nums)
  (-> (listof exact-integer?) boolean?)
  (define (streak last nums)
    (cond
        [(zero? (length nums)) (list last nums)]
        [(equal? 1 (length nums)) (list (car nums) (cdr nums))]
        [(>= (second nums) (first nums)) (streak (second nums) (cdr nums))]
        [else (list last (cdr nums))]))
  ;(define (one-single-streak) (zero? (length (second (streak 1 nums)))))
  (define (with-break)
    (let* ([first-one (streak (first nums) nums)]
           [last-of-first (first first-one)]
           [second-one (streak last-of-first (second first-one))])
           ;(println first-one)
           ;(println second-one)
         (cond
           [(zero? (length (second first-one))) #t]
           [(not (zero? (length (second second-one)))) #f]
           ;[(not (equal? 1 (first (second first-one)))) #f]
           [(not (<= (first second-one) (first nums))) #f]
           [else #t])))
  (cond
    [(equal? (length nums) 1) #t]
    ;[(equal? (first nums) 1) (one-single-streak)]
    [else (with-break)]))

(check (list 1 3 2))
(check (list 6 10 6))
(check (list 3 4 5 1 2))
(check (list 3))
(check (list 1 2 3 4 5 6))
(check (list 3 4 5 6))
(check (list 3 4 5 9))
(check (list 2 1 3 4))
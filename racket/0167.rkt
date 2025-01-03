#lang racket

(define/contract (two-sum numbers target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
    (define/contract (binary-search numbers target start)
      (-> (listof exact-integer?) exact-integer? exact-integer? (or/c exact-integer? boolean?))
      (define/contract (rec numbers target lo hi)
        (-> (listof exact-integer?) exact-integer? exact-integer? exact-integer? (or/c exact-integer? boolean?))
        (let* ([mid (quotient (+ hi lo) 2)]
               [n (list-ref numbers mid)])
          (cond
            [(> lo hi) #f]
            [else 
               (cond 
                  [(equal? n target) mid] 
                  [(> n target) (rec numbers target lo (- mid 1))] 
                  [else (rec numbers target (+ mid 1) hi)])])))
      (rec numbers target start (- (length numbers) 1)))
    (define (next-pos p)
      (let* ([n (list-ref numbers p)]
             [start (+ 1 p)])
       (if (equal? n (list-ref numbers start)) (next-pos start) start)))
    (define (loop pos)
      (let* ([n (list-ref numbers pos)]
             [t (- target n)]
             [i (binary-search numbers t (+ 1 pos))])
      (cond
        [(not i) (loop (next-pos pos))]
        [else (list (+ 1 pos) (+ 1 i))])))
    (loop 0))

(two-sum (list 2 7 11 15) 9)
(two-sum (list 2 3 4) 6)
(two-sum (list -1 0) -1)
(two-sum [list 1 2 3 4 4 9 56 90] 8)
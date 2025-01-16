#lang racket

(define/contract (find-shortest-sub-array nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (position-list i arr acc)
    (cond [(zero? (length arr)) acc]
          [else 
          (let* ([n (first arr)]
                 [cnt (hash-ref acc n (list))])
                 (position-list (add1 i) (cdr arr) (hash-set acc n (cons i cnt))))
          ]))
   (define positions (position-list 0 nums (hash)))
   (define length-list (for/list ([(k v) positions]) 
       (list k (length v))))
   (define (max-length arr acc)
    (cond [(zero? (length arr)) acc]
           [else (max-length 
                 (cdr arr) 
                 (if (< (second (first arr)) acc) acc (second (first arr))))]))

   (define (indexes-of-length arr-arr len acc)
    (cond [(zero? (length arr-arr)) acc]
          [else (indexes-of-length 
                  (cdr arr-arr) 
                  len 
                  (if (equal? (second (first arr-arr)) len) 
                      (cons (first (first arr-arr)) acc)
                      acc)) ]))
   (define (distance l)
        (- (first l) (last l)))
   (add1 (apply min (for/list ([x (indexes-of-length length-list (max-length length-list 0) (list))]
   ) (distance (dict-ref positions x)))
   ))
)

(find-shortest-sub-array (list 1 2 3 2 1))
(find-shortest-sub-array (list 1 2 2 3 1))
(find-shortest-sub-array (list 1 2 2 3 1 4 2))
(find-shortest-sub-array (list 5 6 7 5 7 7 2 0 5 6))
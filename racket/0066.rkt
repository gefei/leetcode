#lang racket

(define/contract (plus-one digits)
  (-> (listof exact-integer?) (listof exact-integer?))
  (define (add-digit a b c) 
    (let* 
       ([s (+ a b c)]
        [r (modulo s 10)]
        [carry (quotient s 10)])
    (list r carry)))
  (define (do-add digits c acc)
      (cond
        [(equal? (length digits) 0) 
            (if (equal? c 1) (cons 1 acc) acc)]
        [else 
            (let ([sum (add-digit (first digits) c 0)])
             (do-add (cdr digits) (second sum) (cons (first sum) acc))
            )
        ])
      )
  (do-add (reverse digits) 1 (list))
)

(plus-one (list 3 9 9))
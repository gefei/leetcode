#lang racket

(define/contract (max-profit prices)
  (-> (listof exact-integer?) exact-integer?)
  (define (rec prices buy profit)
    (cond
      [(zero? (length prices)) profit]
      [else
        (let ([p (first prices)]
              [others (cdr prices)])
            (cond
              [(< p buy) (rec others p profit)]
              [(> (- p buy) profit) (rec others buy (- p buy))]
              [else (rec others buy profit)]
            ))]))
  (rec prices (first prices) 0))

 (max-profit (list 7 1 5 3 6 4))
 (max-profit (list 7 6 4 3 1))
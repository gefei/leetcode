#lang racket

;  (define (rec prices buy profit)
;    (cond
;      [(zero? (length prices)) profit]
;      [else
;        (let ([p (first prices)]
;              [others (cdr prices)])
;            (cond
;              [(< p buy) (rec others p profit)]
;              [(> (- p buy) profit) (rec others buy (- p buy))]
;              [else (rec others buy profit)]
;            ))]))
;  (rec prices (first prices) 0)

(define/contract (max-profit prices)
  (-> (listof exact-integer?) exact-integer?)
  (second (foldl (lambda (x res) 
    (list (if (< x (first res)) x (first res)) (if (> (- x (first res)) (second res)) (- x (first res)) (second res))))
  (list (first prices) 0) prices)))

 (max-profit (list 7 1 5 3 6 4))
 (max-profit (list 7 6 4 3 1))
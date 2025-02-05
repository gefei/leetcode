#lang racket

(define/contract (are-almost-equal s1 s2)
  (-> string? string? boolean?)
  (let* ([diff (get-diff s1 s2)]
         [len (length diff)])
    (cond [(zero? len) #t]
          [(not (equal? len 2)) #f]
          [else (and (equal? (first (first diff)) (second (second diff)))
                     (equal? (second (first diff)) (first (second diff))))])))

(define (get-diff a b)
    (define (rec i acc)
        (cond [(equal? i (string-length a)) acc]
              [else (let ([x (string-ref a i)]
                          [y (string-ref b i)])
                       (if (equal? x y) (rec (add1 i) acc) (rec (add1 i) (cons (list x y) acc)))) ]))
    (rec 0 (list)))

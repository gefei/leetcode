#lang racket

(define/contract (letter-combinations digits)
  (-> string? (listof string?))
  (define/contract (get-string n)
    (-> exact-integer? string?)
    (define (get-start n) 
      (cond
       [(< n 7) (* 3 (- n 2))]
       [(equal? n 7) 15]
       [(equal? n 8) 19]
       [(equal? n 9) 22]))
    (define (get-length n)
      (cond
          [(equal? n 7) 4]
          [(equal? n 9) 4]
          [else 3]))
    (define start (get-start n))
    (list->string (for/list ([i (get-length n)]) (integer->char (+ i 97 start)))))
  (define (rec digits acc)
   (cond
   [(equal? (string-length digits) 0) (list)]
   [(equal? (string-length digits) 1) 
        (for/list ([c (get-string (- (char->integer (string-ref digits 0)) 48))])
                   (make-string 1 c))]
   [else
        (for*/list ([c (get-string (- (char->integer (string-ref digits 0)) 48))]
                    [r (rec (substring digits 1) acc)])
                    (string-append (make-string 1 c) r))]
  ))
  (rec digits (list))
)


(letter-combinations "")
(letter-combinations "7")
(letter-combinations "9")
(letter-combinations "29")


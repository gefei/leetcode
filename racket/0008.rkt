#lang racket
(require racket/contract)

(define (my-atoi s)
      (define (step-2 s) (
        let* (
          [c (string-ref s 0)]
          [sign (if (equal? c #\-) -1 1)]
          [rest (if (or (equal? c #\-) (equal? c #\+)) (substring s 1) s)]
          )
          (list sign rest)))
      (define (step-3 s sign) 
        (define (rec1 t acc) 
          (if (equal? (string-length t) 0) acc 
            (let (
              [fi (string-ref t 0)])
            (cond 
                [(char<? fi #\0) acc]
                [(char>? fi #\9) acc]
                [else 
                (let ([res (+ (* acc 10) (string->number (string fi)))])
                  (cond
                  [(and (>= res 2147483648) (equal? sign 1)) 2147483647]
                  [(and (> res 2147483648) (equal? sign -1)) 2147483648]
                  [else (rec1 (substring t 1) res)])
                )]
                ))
          ))
          (rec1 s 0))
      
          (let([s1 (string-trim s)]) 
            (cond 
              [(equal? (string-length s1) 0) 0]
              [else 
                (let* ([s2 (step-2 s1)]
                     [sign (car s2)]
                     [rest (car (cdr s2))]
                     [num (step-3 rest sign)])
                  (* num sign))
              ]
            ))
)


      

(my-atoi "-48")
(my-atoi "+48")
(my-atoi "48")
(my-atoi "1337c0d3")
(my-atoi "a120" )
(my-atoi "" )
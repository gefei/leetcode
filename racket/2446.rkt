#lang racket

(define/contract (have-conflict event1 event2)
  (-> (listof string?) (listof string?) boolean?)
  (struct time (hour min))
  (define (string->time s)
    (time (string->number (substring s 0 2)) (string->number (substring s 3)))
  )
  (define (time>= x y)
        (cond
            [(> (time-hour x) (time-hour y)) #t]
            [(equal? (time-hour x) (time-hour y)) (>= (time-min x) (time-min y))]
            [else #f]))
  (let ([e1_start (string->time (first event1))]
        [e1_end (string->time (second event1))]
        [e2_start (string->time (first event2))]
        [e2_end (string->time (second event2))])
        (if (time>= e2_start e1_start) (time>= e1_end e2_start) (time>= e2_end e1_start))))

(have-conflict (list "01:15" "02:00") (list "02:00" "03:00"))
(have-conflict (list "01:00" "02:00") (list "01:20" "03:00"))
(have-conflict (list "10:00" "11:00") (list "14:00" "15:00"))
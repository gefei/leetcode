#lang racket

(define/contract (find-difference nums1 nums2)
  (-> (listof exact-integer?) (listof exact-integer?) (listof (listof exact-integer?)))
  (let ([inter (set-intersect nums1 nums2)])
    (list (set->list (set-subtract nums1 inter)) (set->list (set-subtract nums2 inter)))))
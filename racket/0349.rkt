#lang racket

(define/contract (intersection nums1 nums2)
  (-> (listof exact-integer?) (listof exact-integer?) (listof exact-integer?))
  (let* ([s1 (list->set nums1)]
         [s2 (list->set nums2)]
         [inter (set-intersect s1 s2)])
         (set->list inter)))

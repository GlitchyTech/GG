#lang racket

(define (cont-frac n d k)
  (define (iter current result)
    (cond ((= k current) (iter (- current 1) (/ (n (- current 1)) (+ (d (- current 1)) (/ (n current) (d current))))))
          ((= current 0) result)
          (else (iter (- current 1) (/ (n current) (+ result (d current)))))))
  (if (= k 1) 
      (/ (n k) (d k))
      (iter k 0)))

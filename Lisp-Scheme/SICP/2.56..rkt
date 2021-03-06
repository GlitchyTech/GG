#lang racket

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp)
           (make-exponentiation (base exp)
                                (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else
         (error "Undefined expression -- DERIV" exp))))


(define (variable? exp) (symbol? exp))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (make-product m1 m2)
  (cond ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((or (=number? m1 0) (=number? m2 0)) 0)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (square x) (* x x))

(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (fast-exp (square b) (/ n 2)))
        (else (* b (fast-exp b (- n 1))))))

(define (make-exponentiation base exp)
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        ((and (number? base) (number? exp)) (fast-exp exp base))
        (else (list '** base exp))))

(define (base exp) (cadr exp))

(define (exponent exp) (caddr exp))

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))